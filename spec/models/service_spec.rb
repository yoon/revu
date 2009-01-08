# == Schema Information
# Schema version: 20090107212312
#
# Table name: services
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  identifier   :string(255)
#  title        :text
#  description  :text
#  organization :text
#  service_type :string(255)
#  starts_on    :date
#  ends_on      :date
#  created_at   :datetime
#  updated_at   :datetime
#

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
  it "should be invalid without a title" do
    @service = Service.new()
    @service.should have(1).errors_on(:title)
    @service.title = ""
    @service.should have(1).errors_on(:title)
  end
end
