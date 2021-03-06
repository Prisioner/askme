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

ActiveRecord::Schema.define(version: 20170901121727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "linked_tags_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "linked_tag_id", null: false
    t.index ["linked_tag_id", "tag_id"], name: "index_linked_tags_tags_on_linked_tag_id_and_tag_id"
    t.index ["tag_id", "linked_tag_id"], name: "index_linked_tags_tags_on_tag_id_and_linked_tag_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "author_id"
    t.string "ip"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "tag_id", null: false
    t.index ["question_id", "tag_id"], name: "index_questions_tags_on_question_id_and_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "avatar_url"
    t.string "avatar_bg_color"
    t.string "avatar_border_color"
    t.string "profile_text_color"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "questions", "users"
end
