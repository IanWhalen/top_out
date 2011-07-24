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

ActiveRecord::Schema.define(:version => 20110723225546) do

  create_table "climbing_sessions", :force => true do |t|
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_problems", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_routes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gyms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", :force => true do |t|
    t.string   "color_one"
    t.string   "color_two"
    t.string   "color_three"
    t.string   "difficulty_display"
    t.integer  "difficulty_position"
    t.boolean  "is_live"
    t.integer  "wall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.string   "color_one"
    t.string   "color_two"
    t.string   "color_three"
    t.string   "difficulty_display"
    t.integer  "difficulty_position"
    t.boolean  "is_live"
    t.integer  "wall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "walls", :force => true do |t|
    t.string   "name"
    t.integer  "height"
    t.integer  "gym_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
