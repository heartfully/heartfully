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

ActiveRecord::Schema.define(version: 20140914023345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couples", force: true do |t|
    t.string   "name",        null: false
    t.string   "profile_img"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code", null: false
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests_registries", id: false, force: true do |t|
    t.integer "guest_id",    null: false
    t.integer "registry_id", null: false
  end

  add_index "guests_registries", ["guest_id", "registry_id"], name: "index_guests_registries_on_guest_id_and_registry_id", using: :btree
  add_index "guests_registries", ["registry_id", "guest_id"], name: "index_guests_registries_on_registry_id_and_guest_id", using: :btree

  create_table "item_types", force: true do |t|
    t.string   "name",                                  null: false
    t.text     "description"
    t.decimal  "price",         precision: 9, scale: 2, null: false
    t.string   "thumbnail_img"
    t.integer  "project_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_types", ["project_id", "name"], name: "index_item_types_on_project_id_and_name", unique: true, using: :btree
  add_index "item_types", ["project_id"], name: "index_item_types_on_project_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "item_type_id", null: false
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree
  add_index "items", ["purchase_id"], name: "index_items_on_purchase_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "profile_img"
    t.integer  "admin_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["admin_id"], name: "index_organizations_on_admin_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",                                                    null: false
    t.string   "headline"
    t.text     "description"
    t.string   "banner_img"
    t.string   "city"
    t.string   "state"
    t.string   "country",                                                 null: false
    t.decimal  "funding_goal",    precision: 11, scale: 2
    t.datetime "closed_at"
    t.boolean  "public?",                                  default: true, null: false
    t.integer  "organization_id",                                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["organization_id", "name"], name: "index_projects_on_organization_id_and_name", unique: true, using: :btree
  add_index "projects", ["organization_id"], name: "index_projects_on_organization_id", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "user_id",      null: false
    t.text     "message"
    t.datetime "purchased_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "registries", force: true do |t|
    t.string   "name"
    t.string   "url_slug",    null: false
    t.string   "banner_img"
    t.text     "description"
    t.integer  "couple_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registries", ["couple_id"], name: "index_registries_on_couple_id", using: :btree
  add_index "registries", ["url_slug"], name: "index_registries_on_url_slug", unique: true, using: :btree

  create_table "registry_projects", force: true do |t|
    t.integer  "registry_id", null: false
    t.integer  "project_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registry_projects", ["project_id"], name: "index_registry_projects_on_project_id", using: :btree
  add_index "registry_projects", ["registry_id"], name: "index_registry_projects_on_registry_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                           null: false
    t.string   "password_digest",     limit: 128,                 null: false
    t.string   "remember_digest",     limit: 128
    t.string   "reset_digest",        limit: 128
    t.datetime "reset_sent_at"
    t.string   "confirmation_digest", limit: 128
    t.datetime "confirmed_at"
    t.string   "first_name",                                      null: false
    t.string   "last_name"
    t.string   "profile_img"
    t.integer  "couple_id"
    t.integer  "organization_id"
    t.boolean  "system_admin",                    default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["couple_id"], name: "index_users_on_couple_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

end
