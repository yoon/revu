class Publication < ActiveRecord::Base
  
  alias_attribute :pubmed, :pubmed_identiifer
  alias_attribute :medline, :medline_identifier
  alias_attribute :doi, :digital_object_identifier
  alias_attribute :pii, :controlled_publisher_identifier
  alias_attribute :ta, :journal_abbreviation
  alias_attribute :date, :published_on
  
  def publication_types
    [ "peer-reviewed",
      "non peer-reviewed",
      "book chapter",
      "other" ]
  end
end
