class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.boolean :add
      t.boolean :state

      t.timestamps
    end
  end
end
