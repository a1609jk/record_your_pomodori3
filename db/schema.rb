# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140409003818) do

  create_table "daily_reports", force: true do |t|
    t.integer  "day"
    t.integer  "pomodori"
    t.integer  "task"
    t.string   "memo"
    t.integer  "monthly_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daily_reports", ["monthly_report_id"], name: "index_daily_reports_on_monthly_report_id"

  create_table "monthly_reports", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.string   "memo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_reports", ["user_id"], name: "index_monthly_reports_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
