require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activities/index.html.erb" do
  include ActivitiesHelper
  
  before(:each) do
    assigns[:activities] = [
      stub_model(Activity),
      stub_model(Activity)
    ]
  end

  it "should render list of activities" do
    render "/activities/index.html.erb"
  end
end

