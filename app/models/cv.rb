class Cv < ActiveRecord::Base
  belongs_to :person
  has_many :citations
  has_many :grants,         :through => :citations, :source => :grant,        :conditions => "citations.activity_type = 'Grant'"
  has_many :publications,   :through => :citations, :source => :publication,  :conditions => "citations.activity_type = 'Publication'"  
  has_many :presentations,  :through => :citations, :source => :presentation, :conditions => "citations.activity_type = 'Presentation'"
  has_many :services,       :through => :citations, :source => :service,      :conditions => "citations.activity_type = 'Service'"
  
end
