require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cv do
  before(:each) do
    @valid_attributes = {
      :person_id => "1",
      :identifier => "value for identifier",
      :title => "value for title",
      :citation_format => "value for citation_format"
    }
  end

  it "should create a new instance given valid attributes" do
    Cv.create!(@valid_attributes)
  end
end
