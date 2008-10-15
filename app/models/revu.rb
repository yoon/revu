class Revu < ActiveRecord::Base
  # Associations
  belongs_to :revuable, :polymorphic => :true
  belongs_to :person
  
  # Validations
  validates_numericality_of :revuable_id
  validates_numericality_of :person_id
  validates_numericality_of :effort, :academic_value
  validates_each :starts_on do |record, attr_name, value|
    if !value.nil? and !record.ends_on.nil? and value > record.ends_on
      record.errors.add(attr_name, "must start after it ends")
    end
  end
  
  # Instance_methods
  def status(date = Date.today)
    # :current is inclusive of records starting and ending today
    (!self.ends_on.nil? and self.ends_on < date) ? :past : (!self.starts_on.nil? and self.starts_on > date) ? :future : :current
  end
end
class PublicationRevu < Revu
  # Validations
  validates_numericality_of :author_rank_score, :impact_factor
end
class AdministrativeRevu < Revu
  # Validations
  validates_numericality_of :role
end
class TeachingRevu < Revu
  # Validations
  validates_numericality_of :score
end
class ResearchRevu < Revu
  # Validations
  validates_numericality_of :funding_modifier, :pi_status
end