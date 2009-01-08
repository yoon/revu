# == Schema Information
# Schema version: 20090107212312
#
# Table name: presentations
#
#  id                :integer         not null, primary key
#  person_id         :integer
#  identifier        :string(255)
#  title             :text
#  description       :text
#  meeting           :text
#  location          :text
#  presentation_type :string(255)
#  presented_on      :date
#  created_at        :datetime
#  updated_at        :datetime
#

class Presentation < Activity

  alias_attribute :date, :presented_on
  
  def self.types
    [ "invited lecture", 
      "scientific exhibit",
      "peer-reviewed oral presentation",
      "peer-reviewed poster",
      "other" ]
  end
end
