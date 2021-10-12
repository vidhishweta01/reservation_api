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

ActiveRecord::Schema.define(version: 2021_10_12_161210) do

  create_table "bookings", force: :cascade do |t|
    t.boolean "cancelled"
    t.datetime "booking_time"
    t.integer "spa_n_salon_id", null: false
    t.integer "user_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_bookings_on_service_id"
    t.index ["spa_n_salon_id"], name: "index_bookings_on_spa_n_salon_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.float "cost"
    t.float "duration"
    t.integer "spa_n_salon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spa_n_salon_id"], name: "index_services_on_spa_n_salon_id"
  end

  create_table "spa_n_salons", force: :cascade do |t|
    t.string "companyName"
    t.string "GSTIN"
    t.string "PAN"
    t.string "address"
    t.integer "available_chairs"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_spa_n_salons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_no"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_schedules", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "spa_n_salon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spa_n_salon_id"], name: "index_work_schedules_on_spa_n_salon_id"
  end

  add_foreign_key "bookings", "services"
  add_foreign_key "bookings", "spa_n_salons"
  add_foreign_key "bookings", "users"
  add_foreign_key "services", "spa_n_salons"
  add_foreign_key "spa_n_salons", "users"
  add_foreign_key "work_schedules", "spa_n_salons"
end
