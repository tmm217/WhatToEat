# == Schema Information
#
# Table name: cuisineagrees
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ca_id      :integer
#  cfood_id   :integer
#

class Cuisineagree < ApplicationRecord
  belongs_to :c_agreer, :class_name => "User", :foreign_key => "ca_id"
  belongs_to :c_food, :class_name => "Cuisine", :foreign_key => "cfood_id"
end
