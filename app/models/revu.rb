class Revu < ActiveRecord::Base
  # Associations
  belongs_to :revuable, :polymorphic => :true
  belongs_to :person
  
  # Validations
  validates_numericality_of :revuable_id
  validates_numericality_of :person_id
  validates_numericality_of :effort, :academic_value

end
class PublicationRevu < Revu
  validates_numericality_of :author_rank_score, :impact_factor
end
class AdministrativeRevu < Revu
  validates_numericality_of :role
end
class TeachingRevu < Revu
  validates_numericality_of :score
end
class ResearchRevu < Revu
  validates_numericality_of :funding_modifier, :pi_status
end