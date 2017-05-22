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

ActiveRecord::Schema.define(version: 20170522133317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.bigint   "abn"
    t.boolean  "abn_valid"
    t.string   "name"
    t.json     "abn_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_messages", force: :cascade do |t|
    t.text     "message",                            null: false
    t.string   "email",                              null: false
    t.integer  "sender_id",                          null: false
    t.boolean  "approved_financing", default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "message",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.integer  "phone_number"
  end

  create_table "offers", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "price"
    t.string   "type",        null: false
    t.integer  "status",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "period"
    t.integer  "property_id"
    t.index ["property_id"], name: "index_offers_on_property_id", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "address",       default: "",    null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "property_type", default: "",    null: false
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "car_spaces"
    t.integer  "land_area"
    t.integer  "floor_area"
    t.boolean  "lounge_room",   default: false
    t.boolean  "kitchen",       default: false
    t.boolean  "dinning_room",  default: false
    t.boolean  "laundry",       default: false
    t.boolean  "on_sweet",      default: false
    t.boolean  "powder_room",   default: false
    t.index ["user_id"], name: "index_properties_on_user_id", using: :btree
  end

  create_table "property_galleries", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "images",      default: [],              array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.integer  "phone_number"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "account_type",        default: 0, null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["perishable_token"], name: "index_users_on_perishable_token", unique: true, using: :btree
    t.index ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree
    t.index ["single_access_token"], name: "index_users_on_single_access_token", unique: true, using: :btree
  end

  add_foreign_key "offers", "properties"
  add_foreign_key "users", "companies"
end
