class Revu < ActiveRecord::Base
  # Associations
  belongs_to :revuable, :polymorphic => :true
  belongs_to :person
  
  # Validations
  validates_numericality_of :revuable_id
  validates_numericality_of :person_id
  validates_numericality_of :effort, :academic_value
  # validates_numericality_of :author_rank_score, :impact_factor #Publication
  # validates_numericality_of :role #Administrative
  # validates_numericality_of :score #Teaching
  # validates_numericality_of :funding_modifier, :pi_status #Research
end