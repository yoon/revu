# == Schema Information
# Schema version: 20081016191436
#
# Table name: presentations
#
#  id                :integer         not null, primary key
#  person_id         :integer
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
  has_one :revu, :as => :activity
  alias_attribute :date, :presented_on
  
  def presentation_types
    [ "invited lecture", 
      "scientific exhibit",
      "peer-reviewed oral presentation",
      "peer-reviewed poster",
      "other" ]
  end
end
