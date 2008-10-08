require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Revu do
  before(:each) do
    @valid_attributes = {
      :effort => "1.5",
      :academic_value => "1.5",
      :author_rank_score => "1.5",
      :impact_factor => "1.5",
      :role => "1.5",
      :score => "1.5",
      :funding_modifier => "1.5",
      :pi_status => "1.5",
      :type => "value for type"
    }
  end

  it "should create a new instance given valid attributes" do
    Revu.create!(@valid_attributes)
  end
end
