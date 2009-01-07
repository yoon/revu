require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activities/new.html.erb" do
  include ActivitiesHelper
  
  before(:each) do
    assigns[:activity] = stub_model(Activity,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/activities/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", activities_path) do
    end
  end
end


