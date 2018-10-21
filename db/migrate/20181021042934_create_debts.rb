class CreateDebts < ActiveRecord::Migration[5.1]
  def change
    create_table :debts do |t|
      t.integer :type_id
      t.string :name
      t.integer :user_id
      t.float :amount
      t.float :interest
      t.string :compound_frequency
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
