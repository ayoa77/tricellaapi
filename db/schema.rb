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

ActiveRecord::Schema.define(version: 20170524100923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.time     "pill_time"
    t.time     "tracker_time"
    t.string   "family",       default: [],              array: true
    t.integer  "pill_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["pill_id"], name: "index_alerts_on_pill_id", using: :btree
  end

  create_table "pills", force: :cascade do |t|
    t.string   "name"
    t.string   "reminder"
    t.string   "trackers"
    t.string   "remind_trackers"
    t.datetime "time_taken"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_pills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
