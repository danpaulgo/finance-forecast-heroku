class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "email"
      t.string "password_digest"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "last_name"
      t.boolean "intro_quiz_complete", default: false
      t.date "birthday"
      t.string "remember_digest"
      t.string "activation_digest"
      t.boolean "activated", default: false
      t.datetime "activated_at"
      t.string "reset_digest"
      t.datetime "reset_sent_at"
      t.index ["email"], name: "index_users_on_email"
    end
  end
end
