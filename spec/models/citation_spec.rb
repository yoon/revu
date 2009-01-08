# == Schema Information
# Schema version: 20090107212312
#
# Table name: citations
#
#  id            :integer         not null, primary key
#  cv_id         :integer
#  activity_type :string(255)
#  activity_id   :string(255)
#  display_order :integer
#  text          :text
#  created_at    :datetime
#  updated_at    :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Citation do
  before(:each) do
    @valid_attributes = {
      :cv_id => "1",
      :activity_type => "value for activity_type",
      :activity_id => "value for activity_id",
      :display_order => "1",
      :text => "value for text"
    }
  end

  it "should create a new instance given valid attributes" do
    Citation.create!(@valid_attributes)
  end
end
