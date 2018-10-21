class CreateResourceNames < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_names do |t|
      t.string :name
      t.string :table_name
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
