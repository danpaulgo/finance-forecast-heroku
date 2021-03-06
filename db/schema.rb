# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181021093944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.integer "type_id"
    t.integer "user_id"
    t.string "name"
    t.float "amount"
    t.boolean "primary"
    t.boolean "liquid"
    t.float "interest"
    t.string "compound_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer "type_id"
    t.string "name"
    t.integer "user_id"
    t.float "amount"
    t.float "interest"
    t.string "compound_frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "type_id"
    t.string "name"
    t.integer "user_id"
    t.float "amount"
    t.string "frequency"
    t.integer "associated_asset_id"
    t.datetime "next_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "type_id"
    t.string "name"
    t.integer "user_id"
    t.float "amount"
    t.string "frequency"
    t.integer "associated_asset_id"
    t.datetime "next_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_estate_appreciations", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.float "appreciation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_names", force: :cascade do |t|
    t.string "name"
    t.string "table_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_types", force: :cascade do |t|
    t.integer "resource_name_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "type_id"
    t.integer "user_id"
    t.integer "liquid_asset_from_id"
    t.integer "destination_id"
    t.datetime "next_date"
    t.datetime "end_date"
    t.float "amount"
    t.string "frequency"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
