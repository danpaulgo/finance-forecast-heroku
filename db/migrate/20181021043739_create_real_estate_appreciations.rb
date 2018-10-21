class CreateRealEstateAppreciations < ActiveRecord::Migration[5.1]
  def change
    create_table :real_estate_appreciations do |t|
      t.string :name
      t.string :abbreviation
      t.float :appreciation
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
