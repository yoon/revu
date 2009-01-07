class Activity < ActiveRecord::Base
  include TinyCode
  self.abstract_class = true
  
  # Associations
  has_one :revu, :as => :activity
  has_many :citations, :as => :activity
  has_many :cvs, :through => :citations
  
  # Instance methods
  def initialize(*attrs)
    super(*attrs)
    default_attrs
  end
  def default_attrs
    begin self.identifier = Activity.make_tiny_code(10) end until errors.on(:identifier).nil? #begin end block makes the code run at least once
  end
  def to_param # use identifier instead of id to generate urls
    (identifier = self.identifier) ? identifier.to_s : super
  end
  
end