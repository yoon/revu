class CvsController < ApplicationController
  before_filter :login_required
  before_filter :find_cv, :except => [:index, :new, :create]

  layout 'activities'
  
  # GET /cvs
  # GET /cvs.xml
  def index
    @cvs = Cv.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cvs }
    end
  end

  # GET /cvs/1
  # GET /cvs/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cv }
    end
  end

  # GET /cvs/new
  # GET /cvs/new.xml
  def new
    @cv = Cv.new(:person_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cv }
    end
  end

  # GET /cvs/1/edit
  def edit    
    @activities = Activity.all_activities - (@cv.citations || []).map(&:activity)
  end

  # POST /cvs
  # POST /cvs.xml
  def create
    @cv = Cv.new(params[:cv])

    respond_to do |format|
      if @cv.save
        flash[:notice] = 'Cv was successfully created.'
        format.html { redirect_to(edit_cv_path(@cv)) }
        format.xml  { render :xml => @cv, :status => :created, :location => @cv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cvs/1
  # PUT /cvs/1.xml
  def update
    params[:cv][:existing_cs] ||= {}
    
    respond_to do |format|
      if @cv.update_attributes(params[:cv])
        flash[:notice] = 'Cv was successfully updated.'
        # format.html { redirect_to(cvs_path) }
        format.html{ redirect_to :action => "edit"}
        format.js   { render :json => {:status => :ok}.to_json }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js   { render :json => {:status => :fail}.to_json }
        format.xml  { render :xml => @cv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cvs/1
  # DELETE /cvs/1.xml
  def destroy
    @cv.destroy

    respond_to do |format|
      format.html { redirect_to(cvs_path) }
      format.xml  { head :ok }
    end
  end
  
  private

  def find_cv
    @cv = Cv.find_by_identifier(params[:id])
  end
  
end
