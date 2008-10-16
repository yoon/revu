require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Presentation do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :meeting => "value for meeting",
      :site => "value for site",
      :presentation_type => "value for presentation_type",
      :presented_on => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Presentation.create!(@valid_attributes)
  end
end
