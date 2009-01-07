# == Schema Information
# Schema version: 20081016191436
#
# Table name: grants
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  title        :text
#  description  :text
#  pi           :text
#  role         :string(255)
#  effort       :string(255)
#  direct_costs :string(255)
#  grant_type   :string(255)
#  starts_on    :date
#  ends_on      :date
#  created_at   :datetime
#  updated_at   :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Grant do
  before(:each) do
    @valid_attributes = {
      :person_id => "1",
      :title => "value for title",
      :pi => "value for pi",
      :role => "value for role",
      :effort => "value for effort",
      :direct_costs => "value for direct_costs",
      :grant_type => "value for grant_type",
      :starts_on => Date.today,
      :ends_on => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Grant.create!(@valid_attributes)
  end
end
