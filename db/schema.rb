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

ActiveRecord::Schema.define(version: 20180416020239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "daily_progress_logs", force: :cascade do |t|
    t.integer  "admin_id"
    t.date     "date"
    t.integer  "processed",  default: 0
    t.integer  "connects",   default: 0
    t.integer  "sets",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_events_on_lead_id", using: :btree
  end

  create_table "leads", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "ip"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "contacted",                 default: false
    t.datetime "appointment_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "notes"
    t.boolean  "connected",                 default: false
    t.boolean  "bad_number",                default: false
    t.string   "advisor"
    t.string   "location"
    t.string   "standard_phone"
    t.boolean  "exclude_from_calling",      default: false
    t.datetime "process_time"
    t.boolean  "hot",                       default: true
    t.date     "first_appointment_set"
    t.date     "first_appointment_actual"
    t.string   "first_appointment_format"
    t.date     "second_appointment_set"
    t.date     "second_appointment_actual"
    t.string   "second_appointment_format"
    t.date     "enrolled_date"
    t.date     "deposit_date"
    t.integer  "sales"
    t.integer  "collected"
    t.string   "status"
    t.string   "next_step"
    t.text     "rep_notes"
    t.integer  "number_of_dials",           default: 0
    t.boolean  "old_lead",                  default: false
    t.string   "meeting_type"
    t.string   "meeting_format"
    t.string   "ip_state"
    t.boolean  "online",                    default: false
  end

  create_table "outreaches", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "admin_id"
    t.string   "auto_text"
  end

  add_foreign_key "events", "leads"
end
