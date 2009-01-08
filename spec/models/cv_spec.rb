# == Schema Information
# Schema version: 20090107212312
#
# Table name: cvs
#
#  id              :integer         not null, primary key
#  person_id       :integer
#  identifier      :string(255)
#  title           :string(255)
#  citation_format :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

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
  it "should be invalid without a title" do
    @cv = Cv.new()
    @cv.should have(1).errors_on(:title)
    @cv.title = ""
    @cv.should have(1).errors_on(:title)
  end
end
