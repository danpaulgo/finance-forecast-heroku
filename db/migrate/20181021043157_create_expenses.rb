class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :type_id
      t.string :name
      t.integer :user_id
      t.float :amount
      t.string :frequency
      t.integer :associated_asset_id
      t.datetime :next_date
      t.datetime :end_date
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
