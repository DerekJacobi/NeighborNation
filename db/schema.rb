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

ActiveRecord::Schema.define(version: 20150722212546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.integer  "forum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["forum_id"], name: "index_comments_on_forum_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "forums", force: :cascade do |t|
    t.string   "topic"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "forum_type"
    t.integer  "user_id"
  end

  add_index "forums", ["user_id"], name: "index_forums_on_user_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "voting",     default: true
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "street"
    t.string   "aptnumber"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "aboutme",            default: ""
    t.string   "recommandations",    default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "suggestion_id"
    t.boolean  "approve"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "votes", ["suggestion_id"], name: "index_votes_on_suggestion_id", using: :btree
  add_index "votes", ["user_id", "suggestion_id"], name: "index_votes_on_user_id_and_suggestion_id", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "comments", "forums"
  add_foreign_key "comments", "users"
  add_foreign_key "forums", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "votes", "suggestions"
  add_foreign_key "votes", "users"
end
