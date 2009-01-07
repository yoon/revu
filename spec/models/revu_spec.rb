# == Schema Information
# Schema version: 20081016191436
#
# Table name: revus
#
#  id                :integer         not null, primary key
#  person_id         :integer
#  revuable_id       :integer
#  revuable_type     :string(255)
#  type              :string(255)
#  effort            :float
#  academic_value    :float
#  author_rank_score :float
#  impact_factor     :float
#  role              :float
#  score             :float
#  funding_modifier  :float
#  pi_status         :float
#  created_at        :datetime
#  updated_at        :datetime
#  starts_on         :date
#  ends_on           :date
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Revu, "validations" do
  before(:each) do
    @valid_attributes = {
      :revuable_id => 1,
      :person_id => 1,
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
    @r = Revu.create!(@valid_attributes)
    %w(author_rank_score impact_factor role score funding_modifier pi_status).each do |attr|
      @r.send("#{attr}=", nil)
      @r.should have(0).errors_on(attr.intern)
    end
    %w(effort academic_value).each do |attr|
      @r.send("#{attr}=", nil)
      @r.should have(1).errors_on(attr.intern)
    end
  end
  it "should be invalid without author_rank_score or impact_factor for PublicationRevu" do
    @pr = PublicationRevu.create!(@valid_attributes)
    %w(role score funding_modifier pi_status).each do |attr|
      @pr.send("#{attr}=", nil)
      @pr.should have(0).errors_on(attr.intern)
    end
    %w(effort academic_value author_rank_score impact_factor).each do |attr|
      @pr.send("#{attr}=", nil)
      @pr.should have(1).errors_on(attr.intern)
    end
  end
  
  it "should be invalid without role for AdministrativeRevu" do
    @ar = AdministrativeRevu.create!(@valid_attributes)
    %w(author_rank_score impact_factor score funding_modifier pi_status).each do |attr|
      @ar.send("#{attr}=", nil)
      @ar.should have(0).errors_on(attr.intern)
    end
    %w(effort academic_value role).each do |attr|
      @ar.send("#{attr}=", nil)
      @ar.should have(1).errors_on(attr.intern)
    end
  end
  
  it "should be invalid without score for TeachingRevu" do
    @tr = TeachingRevu.create!(@valid_attributes)
    %w(author_rank_score impact_factor role funding_modifier pi_status).each do |attr|
      @tr.send("#{attr}=", nil)
      @tr.should have(0).errors_on(attr.intern)
    end
    %w(effort academic_value score).each do |attr|
      @tr.send("#{attr}=", nil)
      @tr.should have(1).errors_on(attr.intern)
    end
  end
  
  it "should be invalid without funding_modifier and pi_status for Research Revu" do
    @rr = ResearchRevu.create!(@valid_attributes)
    %w(author_rank_score impact_factor role score).each do |attr|
      @rr.send("#{attr}=", nil)
      @rr.should have(0).errors_on(attr.intern)
    end
    %w(effort academic_value funding_modifier pi_status).each do |attr|
      @rr.send("#{attr}=", nil)
      @rr.should have(1).errors_on(attr.intern)
    end
  end
end
describe Revu, "initializing" do
  before(:each) do
    @valid_attributes = {
      :revuable_id => 1,
      :person_id => 1,
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
  it "should default to 0.0 for all numeric attributs" do
    @r = Revu.new
    %w(effort academic_value author_rank_score impact_factor role score funding_modifier pi_status).each do |attr|
      @r.send(attr).should == 0.0
    end
  end
end
describe Revu, "values" do
  before(:each) do
    @valid_attributes = {
      :revuable_id => 1,
      :person_id => 1,
      :effort => "1.5",
      :academic_value => "2.5",
      :author_rank_score => "3.5",
      :impact_factor => "4.5",
      :role => "5.5",
      :score => "6.5",
      :funding_modifier => "7.5",
      :pi_status => "8.5",
      :type => "value for type"
    }
  end
  it "should be compute value using effort, academic_value, author_rank_score and impact_factor for PublicationRevu" do
    @pr = PublicationRevu.create!(@valid_attributes)
    @pr.value.should == 1.5*2.5*3.5*4.5
  end
  
  it "should be compute value using effort, academic_value, and role for AdministrativeRevu" do
    @ar = AdministrativeRevu.create!(@valid_attributes)
    @ar.value.should == 1.5*2.5*5.5
  end
  
  it "should be compute value using effort, academic_value, and score for TeachingRevu" do
    @tr = TeachingRevu.create!(@valid_attributes)
    @tr.value.should == 1.5*2.5*6.5
  end
  
  it "should be compute value using effort, academic_value, funding_modifier and pi_status for Research Revu" do
    @rr = ResearchRevu.create!(@valid_attributes)
    @rr.value.should == 1.5*2.5*7.5*8.5
  end
end
