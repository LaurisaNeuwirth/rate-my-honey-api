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

ActiveRecord::Schema.define(version: 20151109233944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text    "content"
    t.integer "topic_id"
    t.integer "rating"
  end

  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "honeys", force: :cascade do |t|
    t.string   "name"
    t.integer  "honey_rating_by_queen"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  add_index "honeys", ["user_id"], name: "index_honeys_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.integer "honey_id"
  end

  add_index "topics", ["honey_id"], name: "index_topics_on_honey_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name",            null: false
    t.string   "hive"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "honeys", "users"
  add_foreign_key "topics", "honeys"
end
