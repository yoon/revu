class Citation < ActiveRecord::Base
  belongs_to :cv
  belongs_to :activity, :polymorphic => true
  belongs_to :grant,        :class_name => "Grant",         :foreign_key => "activity_id"
  belongs_to :publication,  :class_name => "Publication",   :foreign_key => "activity_id"
  belongs_to :presentation, :class_name => "Presentation",  :foreign_key => "activity_id"  
  belongs_to :service,      :class_name => "Service",       :foreign_key => "activity_id"
end
