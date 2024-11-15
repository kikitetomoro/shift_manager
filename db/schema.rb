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

ActiveRecord::Schema[7.2].define(version: 2024_11_12_052536) do
  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "shift_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shift_setting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_setting_id"], name: "index_shift_requests_on_shift_setting_id"
    t.index ["user_id"], name: "index_shift_requests_on_user_id"
  end

  create_table "shift_settings", force: :cascade do |t|
    t.integer "admin_user_id", null: false
    t.string "name"
    t.integer "send_date"
    t.integer "remind_date"
    t.integer "deadline_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_shift_settings_on_admin_user_id"
  end

  create_table "shift_times", force: :cascade do |t|
    t.integer "shift_request_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_request_id"], name: "index_shift_times_on_shift_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.integer "employee_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_shifts", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.integer "shortage_count"
    t.string "shortage_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shift_requests", "shift_settings"
  add_foreign_key "shift_requests", "users"
  add_foreign_key "shift_settings", "admin_users"
  add_foreign_key "shift_times", "shift_requests"
end
