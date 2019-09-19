# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_19_164724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_schedules", force: :cascade do |t|
    t.integer "day_of_week", limit: 2, null: false
    t.integer "open_time", default: 0
    t.integer "close_time", default: 0
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_day_schedules_on_restaurant_id"
  end

  create_table "dining_tables", force: :cascade do |t|
    t.integer "number", limit: 2, null: false
    t.integer "quantity_of_persons", limit: 2, default: 1, null: false
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_dining_tables_on_restaurant_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reserve_date", null: false
    t.integer "reserve_start", null: false
    t.integer "reserve_end", null: false
    t.string "reserver_name", limit: 50, null: false
    t.bigint "dining_table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dining_table_id"], name: "index_reservations_on_dining_table_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.text "description"
    t.string "logo", limit: 400
    t.string "website", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "day_schedules", "restaurants"
  add_foreign_key "dining_tables", "restaurants"
  add_foreign_key "reservations", "dining_tables"
end
