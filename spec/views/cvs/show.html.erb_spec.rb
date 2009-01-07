require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cvs/show.html.erb" do
  include CvsHelper
  
  before(:each) do
    assigns[:cv] = @cv = stub_model(Cv)
  end

  it "should render attributes in <p>" do
    render "/cvs/show.html.erb"
  end
end

