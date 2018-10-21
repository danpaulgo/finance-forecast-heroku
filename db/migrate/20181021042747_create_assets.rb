class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.integer :type_id
      t.integer :user_id
      t.string :name
      t.float :amount
      t.boolean :primary
      t.boolean :liquid
      t.float :interest
      t.string :compound_frequency
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
