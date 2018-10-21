class CreateResourceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_types do |t|
      t.integer :resource_name_id
      t.string :name
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
