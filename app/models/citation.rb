# == Schema Information
# Schema version: 20090107212312
#
# Table name: citations
#
#  id            :integer         not null, primary key
#  cv_id         :integer
#  activity_type :string(255)
#  activity_id   :string(255)
#  display_order :integer
#  text          :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Citation < ActiveRecord::Base
  belongs_to :cv
  belongs_to :activity, :polymorphic => true
  belongs_to :grant,        :class_name => "Grant",         :foreign_key => "activity_id"
  belongs_to :publication,  :class_name => "Publication",   :foreign_key => "activity_id"
  belongs_to :presentation, :class_name => "Presentation",  :foreign_key => "activity_id"  
  belongs_to :service,      :class_name => "Service",       :foreign_key => "activity_id"
end
