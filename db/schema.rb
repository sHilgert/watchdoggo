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

ActiveRecord::Schema.define(version: 20181103202946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text", null: false
    t.string "external_chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "site_id"
    t.integer "http_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_responses_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "url", null: false
    t.boolean "enabled", default: true, null: false
  end

  create_table "sites_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "site_id"
    t.index ["site_id"], name: "index_sites_users_on_site_id"
    t.index ["user_id"], name: "index_sites_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "external_id", null: false
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "users"
  add_foreign_key "responses", "sites"
  add_foreign_key "sites_users", "sites"
  add_foreign_key "sites_users", "users"
end
