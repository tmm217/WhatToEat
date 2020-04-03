# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ApplicationRecord
  has_many :cuisineagrees, :foreign_key => "cfood_id", :dependent => :destroy
  has_many :dishes, :dependent => :destroy

  validates :title, :uniqueness => { :scope => :image }
end
