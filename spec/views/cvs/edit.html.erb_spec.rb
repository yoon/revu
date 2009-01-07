require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cvs/edit.html.erb" do
  include CvsHelper
  
  before(:each) do
    assigns[:cv] = @cv = stub_model(Cv,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/cvs/edit.html.erb"
    
    response.should have_tag("form[action=#{cv_path(@cv)}][method=post]") do
    end
  end
end


