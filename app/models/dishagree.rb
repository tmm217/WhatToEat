# == Schema Information
#
# Table name: dishagrees
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  da_id      :integer
#  dfood_id   :integer
#

class Dishagree < ApplicationRecord
  belongs_to :d_agreer, :class_name => "User", :foreign_key => "da_id"
  belongs_to :d_food, :class_name => "Dish", :foreign_key => "dfood_id"
end
