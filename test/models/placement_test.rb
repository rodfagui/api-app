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

require 'test_helper'

class PlacementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
