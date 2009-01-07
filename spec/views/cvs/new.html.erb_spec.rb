require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cvs/new.html.erb" do
  include CvsHelper
  
  before(:each) do
    assigns[:cv] = stub_model(Cv,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/cvs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", cvs_path) do
    end
  end
end


