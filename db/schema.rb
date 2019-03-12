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

ActiveRecord::Schema.define(version: 2019_03_12_142923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_types", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_action_types_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.text "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variety_id"
    t.bigint "parcel_id"
    t.bigint "action_type_id"
    t.integer "quantity"
    t.string "unit"
    t.index ["action_type_id"], name: "index_events_on_action_type_id"
    t.index ["parcel_id"], name: "index_events_on_parcel_id"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["variety_id"], name: "index_events_on_variety_id"
  end

  create_table "fertilizations", force: :cascade do |t|
    t.date "date"
    t.bigint "fertilizer_id"
    t.float "quantity"
    t.bigint "parcel_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fertilizer_id"], name: "index_fertilizations_on_fertilizer_id"
    t.index ["parcel_id"], name: "index_fertilizations_on_parcel_id"
    t.index ["user_id"], name: "index_fertilizations_on_user_id"
  end

  create_table "fertilizers", force: :cascade do |t|
    t.string "name"
    t.integer "nitrogen"
    t.integer "phosphorus"
    t.integer "potassium"
    t.string "supplier"
    t.text "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fertilizers_on_user_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.string "idPlace"
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parcels_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.date "date"
    t.bigint "variety_id"
    t.text "details"
    t.float "quantity"
    t.string "unit"
    t.bigint "parcel_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parcel_id"], name: "index_treatments_on_parcel_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
    t.index ["variety_id"], name: "index_treatments_on_variety_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.bigint "vegetable_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_varieties_on_user_id"
    t.index ["vegetable_id"], name: "index_varieties_on_vegetable_id"
  end

  create_table "vegetables", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vegetables_on_user_id"
  end

  add_foreign_key "action_types", "users"
  add_foreign_key "events", "action_types"
  add_foreign_key "events", "parcels"
  add_foreign_key "events", "users"
  add_foreign_key "events", "varieties"
  add_foreign_key "fertilizations", "fertilizers"
  add_foreign_key "fertilizations", "parcels"
  add_foreign_key "fertilizations", "users"
  add_foreign_key "fertilizers", "users"
  add_foreign_key "parcels", "users"
  add_foreign_key "treatments", "parcels"
  add_foreign_key "treatments", "users"
  add_foreign_key "treatments", "varieties"
  add_foreign_key "varieties", "users"
  add_foreign_key "varieties", "vegetables"
  add_foreign_key "vegetables", "users"
end
