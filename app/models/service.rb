# == Schema Information
# Schema version: 20090107212312
#
# Table name: services
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  identifier   :string(255)
#  title        :text
#  description  :text
#  organization :text
#  service_type :string(255)
#  starts_on    :date
#  ends_on      :date
#  created_at   :datetime
#  updated_at   :datetime
#

class Service < Activity

  def self.types
    [ "committee",
      "national society",
      "regional society",
      "exam board",
      "editorial board",
      "journal review",
      "study section",
      "lecture",
      "course",
      "Problem Based Learning (PBL)",
      "case presentation",
      "other" ]
  end
end
