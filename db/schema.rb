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

ActiveRecord::Schema.define(version: 20141003175007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "text",       null: false
    t.integer  "review_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "genres", force: true do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "show_id",                null: false
    t.string   "title",                  null: false
    t.text     "body",                   null: false
    t.integer  "score",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.integer  "vote_score", default: 0
  end

  add_index "reviews", ["show_id"], name: "index_reviews_on_show_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "shows", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "genre_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.string   "poster"
  end

  add_index "shows", ["genre_id"], name: "index_shows_on_genre_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username",                                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "member", null: false
    t.string   "profile_photo"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "review_id"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["review_id", "user_id"], name: "index_votes_on_review_id_and_user_id", unique: true, using: :btree
  add_index "votes", ["review_id"], name: "index_votes_on_review_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
