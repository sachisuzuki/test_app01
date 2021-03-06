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

ActiveRecord::Schema.define(version: 2021_07_05_132226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divesites", force: :cascade do |t|
    t.string "name", null: false
    t.string "region", null: false
    t.string "area", null: false
    t.string "zone", null: false
    t.string "adress", null: false
    t.string "phone", null: false
    t.string "service", null: false
    t.text "discription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "divepoint", null: false
    t.string "status", null: false
    t.integer "temp"
    t.integer "visibility"
    t.text "content"
    t.text "image"
    t.text "video"
    t.bigint "divesite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["divesite_id"], name: "index_posts_on_divesite_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.text "avatar"
    t.bigint "divesite_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["divesite_id"], name: "index_users_on_divesite_id"
    t.index ["email", "uid", "provider"], name: "index_users_on_email_and_uid_and_provider", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "divesites"
  add_foreign_key "posts", "users"
  add_foreign_key "users", "divesites"
end
