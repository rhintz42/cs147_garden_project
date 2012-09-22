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

ActiveRecord::Schema.define(:version => 20120918014252) do

  create_table "personal_plant_comments", :force => true do |t|
    t.text     "body"
    t.string   "commenter"
    t.integer  "days_had_plant"
    t.integer  "num_thumbs_down"
    t.integer  "num_thumbs_up"
    t.float    "rating_ease_care"
    t.float    "rating_ease_pruning"
    t.float    "rating_ease_watering"
    t.integer  "user_id"
    t.integer  "personal_plant_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "personal_plant_comments", ["personal_plant_id"], :name => "index_personal_plant_comments_on_personal_plant_id"
  add_index "personal_plant_comments", ["user_id"], :name => "index_personal_plant_comments_on_user_id"

  create_table "personal_plant_waterings", :force => true do |t|
    t.float    "watering_amount"
    t.float    "watering_time"
    t.integer  "personal_plant_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "personal_plant_waterings", ["personal_plant_id"], :name => "index_personal_plant_waterings_on_personal_plant_id"

  create_table "personal_plants", :force => true do |t|
    t.float    "birthday"
    t.integer  "hardiness_zone"
    t.string   "name_personalized"
    t.float    "rating_ease_care"
    t.float    "rating_ease_pruning"
    t.float    "rating_ease_watering"
    t.integer  "rating_num"
    t.integer  "sun_exposure"
    t.float    "watering_frequency"
    t.integer  "user_id"
    t.integer  "plant_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "personal_plants", ["plant_id"], :name => "index_personal_plants_on_plant_id"
  add_index "personal_plants", ["user_id"], :name => "index_personal_plants_on_user_id"

  create_table "plant_comments", :force => true do |t|
    t.text     "body"
    t.string   "commenter"
    t.integer  "rate_ease_care"
    t.integer  "rate_ease_pruning"
    t.integer  "rate_ease_watering"
    t.integer  "plant_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "plant_comments", ["plant_id"], :name => "index_plant_comments_on_plant_id"
  add_index "plant_comments", ["user_id"], :name => "index_plant_comments_on_user_id"

  create_table "plants", :force => true do |t|
    t.text     "description"
    t.integer  "hardiness_zone"
    t.boolean  "is_houseplant"
    t.float    "leeway_sun_exposure"
    t.float    "leeway_watering_weekly_amount"
    t.string   "name_botanical"
    t.string   "name_common"
    t.string   "plant_type"
    t.float    "rating_ease_care"
    t.float    "rating_ease_pruning"
    t.float    "rating_ease_watering"
    t.integer  "rating_num"
    t.integer  "sun_exposure"
    t.integer  "user_created_by"
    t.float    "watering_frequency_old"
    t.float    "watering_frequency_new"
    t.float    "watering_weekly_amount"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "user_comments", :force => true do |t|
    t.text     "body"
    t.integer  "commenter_id"
    t.string   "commenter_username"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "user_comments", ["user_id"], :name => "index_user_comments_on_user_id"

  create_table "user_messages", :force => true do |t|
    t.text     "body"
    t.integer  "message_type"
    t.integer  "sender_id"
    t.string   "sender_username"
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "user_messages", ["user_id"], :name => "index_user_messages_on_user_id"

  create_table "users", :force => true do |t|
    t.float    "address_latitude"
    t.float    "address_longitude"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.integer  "address_zipcode"
    t.integer  "authorization"
    t.string   "email"
    t.float    "last_login"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "name_middle"
    t.string   "password_digest"
    t.integer  "points"
    t.integer  "salt"
    t.string   "time_zone"
    t.string   "username"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
