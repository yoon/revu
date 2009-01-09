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

class Cv < ActiveRecord::Base
  include TinyCode
  
  # Associations
  belongs_to :person
  has_many :citations, :dependent => :destroy, :order => 'display_order'
  has_many :grants,         :through => :citations, :source => :grant,        :conditions => "citations.activity_type = 'Grant'"
  has_many :publications,   :through => :citations, :source => :publication,  :conditions => "citations.activity_type = 'Publication'"  
  has_many :presentations,  :through => :citations, :source => :presentation, :conditions => "citations.activity_type = 'Presentation'"
  has_many :services,       :through => :citations, :source => :service,      :conditions => "citations.activity_type = 'Service'"
  
  # Validations
  validates_presence_of :title
  validates_associated :citations
  
  # Callbacks
  after_update :save_citations
  
  # Instance methods
  def initialize(*attrs)
    super(*attrs)
    default_attrs
  end
  def default_attrs
    begin self.identifier = Cv.make_tiny_code(10) end until errors.on(:identifier).nil? #begin end block makes the code run at least once
  end
  def to_param # use identifier instead of id to generate urls
    (identifier = self.identifier) ? identifier.to_s : super
  end

  def new_citation_attributes=(citation_attributes)
    citation_attributes.each do |attributes|
      citations.build(attributes)
    end
  end
  
  def existing_citation_attributes=(citation_attributes)
    citations.reject(&:new_record?).each do |citation|
      attributes = citation_attributes[citation.id.to_s]
      if attributes
        citation.attributes = attributes
      else
        citations.delete(citation)
      end
    end
  end
  
  def save_citations
    citations.each do |citation|
      citation.save(false)
    end
  end
  
  # Method aliases
  alias_method :existing_cs=, :existing_citation_attributes=
  alias_method :new_cs=, :new_citation_attributes=
  
end
