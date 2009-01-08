# == Schema Information
# Schema version: 20090107212312
#
# Table name: presentations
#
#  id                :integer         not null, primary key
#  person_id         :integer
#  identifier        :string(255)
#  title             :text
#  description       :text
#  meeting           :text
#  location          :text
#  presentation_type :string(255)
#  presented_on      :date
#  created_at        :datetime
#  updated_at        :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Presentation do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :person_id => "1",
      :meeting => "value for meeting",
      :location => "value for site",
      :presentation_type => "value for presentation_type",
      :presented_on => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Presentation.create!(@valid_attributes)
  end
  it "should be invalid without a title" do
    @presentation = Presentation.new()
    @presentation.should have(1).errors_on(:title)
    @presentation.title = ""
    @presentation.should have(1).errors_on(:title)
  end
end
