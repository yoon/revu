require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Service do
  before(:each) do
    @valid_attributes = {
      :person_id => "1",
      :title => "value for title",
      :organization => "value for organization",
      :description => "value for description",
      :service_type => "value for service_type",
      :starts_on => Date.today,
      :ends_on => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Service.create!(@valid_attributes)
  end
end
