class Presentation < ActiveRecord::Base
  alias_attribute :date, :presented_on
  
  def presentation_types
    [ "invited lecture", 
      "scientific exhibit",
      "peer-reviewed oral presentation",
      "peer-reviewed poster",
      "other" ]
  end
end
