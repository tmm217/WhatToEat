# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cuisine_id  :integer
#

class Dish < ApplicationRecord
  belongs_to :cuisine
  has_many :dishagrees, :foreign_key => "dfood_id", :dependent => :destroy

  validates :name, :uniqueness => { :scope => :description }
end