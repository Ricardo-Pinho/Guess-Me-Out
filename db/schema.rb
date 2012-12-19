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

ActiveRecord::Schema.define(:version => 20121127184508) do

  create_table "avatarcomponents", :force => true do |t|
    t.integer  "avatar_id"
    t.integer  "componenttype_id"
    t.integer  "component_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "avatarcomponents", ["avatar_id"], :name => "index_avatarcomponents_on_avatar_id"
  add_index "avatarcomponents", ["component_id"], :name => "index_avatarcomponents_on_component_id"
  add_index "avatarcomponents", ["componenttype_id"], :name => "index_avatarcomponents_on_componenttype_id"

  create_table "avatars", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "avatars", ["user_id"], :name => "index_avatars_on_user_id"

  create_table "components", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "componenttypes", :force => true do |t|
    t.integer  "color"
    t.string   "name"
    t.integer  "price"
    t.text     "svg"
    t.integer  "component_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "componenttypes", ["component_id"], :name => "index_componenttypes_on_component_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "name"
    t.date     "birthdate"
    t.date     "last_login"
    t.string   "sex"
    t.integer  "credits"
    t.string   "location"
    t.integer  "admin"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
