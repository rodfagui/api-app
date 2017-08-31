class SetDefaultStateInPlacement < ActiveRecord::Migration[5.1]
  def change
    change_column_default :placements, :state, false
  end
end
