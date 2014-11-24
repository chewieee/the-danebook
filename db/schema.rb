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

ActiveRecord::Schema.define(version: 20141124204346) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "friendships", force: true do |t|
    t.integer  "friender_id"
    t.integer  "friended_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friended_id"], name: "index_friendships_on_friended_id"
  add_index "friendships", ["friender_id", "friended_id"], name: "index_friendships_on_friender_id_and_friended_id", unique: true
  add_index "friendships", ["friender_id"], name: "index_friendships_on_friender_id"

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "email",            null: false
    t.string   "password_digest"
    t.integer  "birth_day",        null: false
    t.integer  "birth_month",      null: false
    t.integer  "birth_year",       null: false
    t.string   "gender",           null: false
    t.string   "college"
    t.string   "hometown"
    t.string   "currently_lives"
    t.string   "phone"
    t.string   "words"
    t.string   "about_me"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.integer  "profile_photo_id"
    t.integer  "cover_photo_id"
  end

end
