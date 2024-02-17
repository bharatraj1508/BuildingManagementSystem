# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_11_021526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "building_users", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_users_on_building_id"
    t.index ["user_id"], name: "index_building_users_on_user_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "building_manager"
    t.string "building_supervisor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "action", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "unit_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_users_on_unit_id"
    t.index ["user_id"], name: "index_unit_users_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "unit_number"
    t.string "parking_spot"
    t.string "locker_number"
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_units_on_building_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "roles"
    t.jsonb "contact_details", default: {}
    t.jsonb "vehicle_details", default: {}
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "building_users", "buildings"
  add_foreign_key "building_users", "users"
  add_foreign_key "events", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "unit_users", "units"
  add_foreign_key "unit_users", "users"
  add_foreign_key "units", "buildings"
end
