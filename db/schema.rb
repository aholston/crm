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

ActiveRecord::Schema.define(version: 20180304231240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_name_field_to_attractions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attractions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "house_id"
    t.index ["house_id"], name: "index_attractions_on_house_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "financer"
    t.float "cash"
    t.string "purchase_type"
    t.string "cio"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_buyers_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.date "birthday"
    t.string "listing"
    t.string "cio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "house_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topic"
    t.index ["house_id"], name: "index_comments_on_house_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "description"
    t.string "method"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "agent_id"
    t.index ["agent_id"], name: "index_contacts_on_agent_id"
    t.index ["client_id"], name: "index_contacts_on_client_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "house_id"
    t.index ["house_id"], name: "index_contracts_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.integer "rooms"
    t.integer "bathrooms"
    t.float "sqft"
    t.string "status"
    t.text "description"
    t.float "price"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "commission"
    t.string "info"
    t.integer "phase"
    t.index ["client_id"], name: "index_houses_on_client_id"
  end

  create_table "infolists", force: :cascade do |t|
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_infolists_on_house_id"
  end

  create_table "infos", force: :cascade do |t|
    t.bigint "infolist_id"
    t.string "name"
    t.integer "year"
    t.string "kind"
    t.string "primary_school"
    t.string "high_school"
    t.string "businesses"
    t.date "photographer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.string "prepa"
    t.index ["infolist_id"], name: "index_infos_on_infolist_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "profit_margin"
    t.string "sales_price"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_investors_on_client_id"
  end

  create_table "reccomendations", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reccomendations_on_client_id"
    t.index ["vendor_id"], name: "index_reccomendations_on_vendor_id"
  end

  create_table "showings", force: :cascade do |t|
    t.bigint "house_id"
    t.date "day"
    t.time "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_showings_on_house_id"
  end

  create_table "tasklists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "house_id"
    t.index ["house_id"], name: "index_tasklists_on_house_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "tasklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "task"
    t.integer "step"
    t.index ["tasklist_id"], name: "index_tasks_on_tasklist_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "house_id"
    t.bigint "client_id"
    t.float "sale"
    t.float "commission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_transactions_on_client_id"
    t.index ["house_id"], name: "index_transactions_on_house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "answer1"
    t.string "answer2"
    t.string "answer3"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "company"
    t.string "service"
    t.string "phone"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "website"
  end

  add_foreign_key "attractions", "houses"
  add_foreign_key "buyers", "clients"
  add_foreign_key "comments", "houses"
  add_foreign_key "contacts", "agents"
  add_foreign_key "contacts", "clients"
  add_foreign_key "contracts", "houses"
  add_foreign_key "houses", "clients"
  add_foreign_key "infolists", "houses"
  add_foreign_key "infos", "infolists"
  add_foreign_key "investors", "clients"
  add_foreign_key "reccomendations", "clients"
  add_foreign_key "reccomendations", "vendors"
  add_foreign_key "showings", "houses"
  add_foreign_key "tasklists", "houses"
  add_foreign_key "tasks", "tasklists"
  add_foreign_key "transactions", "clients"
  add_foreign_key "transactions", "houses"
end
