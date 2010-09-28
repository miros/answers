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

ActiveRecord::Schema.define(:version => 20100928111917) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_votes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "type"
    t.integer  "user_id",                      :null => false
    t.integer  "rating",        :default => 0, :null => false
    t.string   "title"
    t.string   "slug"
    t.text     "text",                         :null => false
    t.integer  "views_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answers_count", :default => 0, :null => false
    t.integer  "question_id",   :default => 0, :null => false
  end

  add_index "posts", ["slug"], :name => "index_posts_on_slug"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "questions_tags", :id => false, :force => true do |t|
    t.integer "question_id", :null => false
    t.integer "tag_id",      :null => false
  end

  add_index "questions_tags", ["question_id", "tag_id"], :name => "index_questions_tags_on_question_id_and_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "slug",                           :null => false
    t.integer  "questions_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
