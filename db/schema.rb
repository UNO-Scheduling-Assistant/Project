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

ActiveRecord::Schema.define(version: 20141023212241) do

  create_table "course_dates", force: true do |t|
    t.integer  "year"
    t.string   "semester"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_dates", ["year", "semester"], name: "index_course_dates_on_year_and_semester", unique: true

  create_table "courses", force: true do |t|
    t.integer  "course_id"
    t.string   "subject"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_id", "subject"], name: "index_courses_on_course_id_and_subject", unique: true

  create_table "instructors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "building"
    t.integer  "room_num"
    t.integer  "room_capacity"
    t.string   "desk_type"
    t.string   "board_type"
    t.string   "chair_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["building", "room_num"], name: "index_rooms_on_building_and_room_num", unique: true

  create_table "section_settings", force: true do |t|
    t.integer  "time_slot_id"
    t.integer  "instructor_id"
    t.integer  "room_id"
    t.integer  "course_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "class_num"
    t.integer  "course_id"
    t.integer  "section_setting_id"
    t.integer  "sec_id"
    t.string   "sec_description"
    t.integer  "sec_capacity"
    t.string   "crsatr_val"
    t.string   "mode"
    t.string   "acad_group"
    t.string   "location"
    t.string   "component"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id", "sec_id"], name: "index_sections_on_course_id_and_sec_id", unique: true

  create_table "time_slots", force: true do |t|
    t.string   "days"
    t.integer  "start_time_hour"
    t.integer  "start_time_minute"
    t.integer  "end_time_hour"
    t.integer  "end_time_minute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
