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
  has_many :citations
  has_many :grants,         :through => :citations, :source => :grant,        :conditions => "citations.activity_type = 'Grant'"
  has_many :publications,   :through => :citations, :source => :publication,  :conditions => "citations.activity_type = 'Publication'"  
  has_many :presentations,  :through => :citations, :source => :presentation, :conditions => "citations.activity_type = 'Presentation'"
  has_many :services,       :through => :citations, :source => :service,      :conditions => "citations.activity_type = 'Service'"
  
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


  
end
