class Grant < ActiveRecord::Base
  def grant_types
    [ "NIH/RO1",
      "NIH training",
      "NMH",
      "NUMS",
      "NMFF",
      "Foundation",
      "Industry" ]
  end
end
