# == Schema Information
#
# Table name: placements
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  quantity   :integer
#  add        :boolean
#  state      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Placement < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :quantity, presence: true
  validates :add, inclusion: { in: [true, false] }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  before_save :change_state
  
  def change_state
    product = Product.find_by(id: self.product_id)
    if self.add
      product.quantity += self.quantity
      self.state = true if product.save
    else
      product.quantity -= self.quantity
      self.state = true if product.save
    end
  end
end
