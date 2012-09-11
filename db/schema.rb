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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120909234111) do

  create_table "personal_plants", :force => true do |t|
    t.string   "name_personalized"
    t.integer  "actual_sun_exposure"
    t.float    "watering_frequency"
    t.datetime "last_watering"
    t.datetime "next_watering"
    t.integer  "user_id"
    t.integer  "plant_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "personal_plants", ["plant_id"], :name => "index_personal_plants_on_plant_id"
  add_index "personal_plants", ["user_id"], :name => "index_personal_plants_on_user_id"

  create_table "plants", :force => true do |t|
    t.string   "name_common"
    t.string   "name_botanical"
    t.string   "plant_type"
    t.float    "water_weekly"
    t.float    "water_frequency"
    t.integer  "recommended_sun_exposure"
    t.integer  "actual_sun_exposure"
    t.boolean  "is_houseplant"
    t.text     "description"
    t.boolean  "created_from_user"
    t.integer  "authorization"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last"
    t.string   "password_digest"
    t.string   "username"
    t.string   "email"
    t.integer  "salt"
    t.integer  "authorization"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
