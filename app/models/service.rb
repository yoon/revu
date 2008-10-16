class Service < ActiveRecord::Base
  def service_types
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
