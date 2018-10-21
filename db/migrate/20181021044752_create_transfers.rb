class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.integer :type_id
      t.integer :user_id
      t.integer :liquid_asset_from_id
      t.integer :destination_id
      t.datetime :next_date
      t.datetime :end_date
      t.float :amount
      t.string :frequency
      t.string :name
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
