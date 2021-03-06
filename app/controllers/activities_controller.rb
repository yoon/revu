class ActivitiesController < ApplicationController
  before_filter :login_required
  before_filter :find_activity, :except => :index

  # GET /activities
  # GET /activities.xml
  def index
    @activities = (Grant.all + Publication.all + Presentation.all + Service.all).group_by{|a| a.class.name}.sort
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = @klass.new(:person_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = @klass.new(params[:activity])
    
    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to(activities_path) }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to(activities_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_path) }
      format.xml  { head :ok }
    end
  end
  
  private

  def find_activity
    @klass = params[:activity_type].singularize.capitalize.constantize
    @klass_name = @klass.name.downcase.pluralize
    @activity = @klass.find_by_identifier(params[:activity_id]) if params.has_key?(:activity_id)
  end
  
end
