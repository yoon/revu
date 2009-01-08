# == Schema Information
# Schema version: 20090107212312
#
# Table name: grants
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  identifier   :string(255)
#  title        :text
#  description  :text
#  pi           :text
#  role         :string(255)
#  effort       :string(255)
#  direct_costs :string(255)
#  grant_type   :string(255)
#  starts_on    :date
#  ends_on      :date
#  created_at   :datetime
#  updated_at   :datetime
#

class Grant < Activity
  
  def self.types
    [ "NIH/RO1",
      "NIH training",
      "NMH",
      "NUMS",
      "NMFF",
      "Foundation",
      "Industry" ]
  end
end
