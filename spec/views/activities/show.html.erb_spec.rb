require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activities/show.html.erb" do
  include ActivitiesHelper
  
  before(:each) do
    assigns[:activity] = @activity = stub_model(Activity)
  end

  it "should render attributes in <p>" do
    render "/activities/show.html.erb"
  end
end

