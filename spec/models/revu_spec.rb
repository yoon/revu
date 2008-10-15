require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Revu do
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
