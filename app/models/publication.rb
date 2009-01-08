# == Schema Information
# Schema version: 20090107212312
#
# Table name: publications
#
#  id                              :integer         not null, primary key
#  person_id                       :integer
#  identifier                      :string(255)
#  pubmed_identifier               :string(255)
#  medline_identifier              :string(255)
#  digital_object_identifier       :text
#  controlled_publisher_identifier :text
#  authors                         :text
#  title                           :text
#  journal                         :string(255)
#  journal_abbreviation            :string(255)
#  volume                          :string(255)
#  issue                           :string(255)
#  pages                           :string(255)
#  abstract                        :text
#  mesh                            :text
#  affiliations                    :text
#  source                          :text
#  publication_type                :string(255)
#  year                            :string(255)
#  published_on                    :date
#  created_at                      :datetime
#  updated_at                      :datetime
#

class Publication < Activity

  alias_attribute :pubmed, :pubmed_identiifer
  alias_attribute :medline, :medline_identifier
  alias_attribute :doi, :digital_object_identifier
  alias_attribute :pii, :controlled_publisher_identifier
  alias_attribute :ta, :journal_abbreviation
  alias_attribute :date, :published_on
    
  def self.types
    [ "peer-reviewed",
      "non peer-reviewed",
      "book chapter",
      "other" ]
  end
end
