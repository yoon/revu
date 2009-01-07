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

class Revu < ActiveRecord::Base
  # Associations
  belongs_to :activity, :polymorphic => :true
  belongs_to :person
  
  # Validations
  validates_numericality_of :revuable_id
  validates_numericality_of :person_id
  validates_numericality_of :effort, :academic_value
  validates_each :starts_on do |record, attr_name, value|
    if !value.nil? and !record.ends_on.nil? and value > record.ends_on
      record.errors.add(attr_name, "must start before it ends")
    end
  end
  
  # Instance Methods
  def initialize(*args)
    super(*args)
    default_args
  end
  
  def default_args
    self.effort ||= 0.0
    self.academic_value ||= 0.0
    self.author_rank_score ||= 0.0
    self.impact_factor ||= 0.0
    self.role ||= 0.0
    self.score ||= 0.0
    self.funding_modifier ||= 0.0
    self.pi_status ||= 0.0
  end
  
  def status(date = Date.today)
    # :current is inclusive of records starting and ending today
    (!self.ends_on.nil? and self.ends_on < date.to_date) ? :past : (!self.starts_on.nil? and self.starts_on > date.to_date) ? :future : :current
  end
end
class PublicationRevu < Revu
  # Validations
  validates_numericality_of :author_rank_score, :impact_factor
  
  # Instance methods
  def value
    self.effort * self.academic_value * self.author_rank_score * self.impact_factor
  end
end
class AdministrativeRevu < Revu
  # Validations
  validates_numericality_of :role
  
  # Instance methods
  def value
    self.effort * self.academic_value * self.role
  end
  # COMMUNITY_ROLES = [ ["Officer, national society 4",                 4],
  #                     ["Board Examiner 2",                            2],
  #                     ["Officer, regional society 2",                 2],
  #                     ["Committee Chair, national organization 2",    2],
  #                     ["Committee Chair, regional organization 1",    1],
  #                     ["Committee Member, national organization .5", .5],
  #                     ["Committee Member, regional organization .5", .5]]
end
class TeachingRevu < Revu
  # Validations
  validates_numericality_of :score
  
  # Instance methods
  def value
    self.effort * self.academic_value * self.score
  end
end
class ResearchRevu < Revu
  # Validations
  validates_numericality_of :funding_modifier, :pi_status
  
  # Instance methods
  def value
    self.effort * self.academic_value * self.funding_modifier * self.pi_status
  end
  # FUNDING_MODIFIERS = [ ["NIH/RO1 (initial award, PI)",                 4]]
end
