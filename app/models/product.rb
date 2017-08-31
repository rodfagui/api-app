# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :placements
  validates :name, :price, :quantity, presence: true
  validates :name, uniqueness: { message: "Product exist. Add a placement" }
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
