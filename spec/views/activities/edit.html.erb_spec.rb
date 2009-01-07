require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activities/edit.html.erb" do
  include ActivitiesHelper
  
  before(:each) do
    assigns[:activity] = @activity = stub_model(Activity,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/activities/edit.html.erb"
    
    response.should have_tag("form[action=#{activity_path(@activity)}][method=post]") do
    end
  end
end


