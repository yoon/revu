require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cvs/index.html.erb" do
  include CvsHelper
  
  before(:each) do
    assigns[:cvs] = [
      stub_model(Cv),
      stub_model(Cv)
    ]
  end

  it "should render list of cvs" do
    render "/cvs/index.html.erb"
  end
end

