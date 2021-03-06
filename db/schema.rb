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

ActiveRecord::Schema.define(version: 20170405024012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name",     null: false
    t.string "cat_type", null: false
  end

  create_table "consultation_requests", force: true do |t|
    t.string "email"
    t.string "couple_names"
    t.string "phone_number"
    t.string "preferred_contact_method"
  end

  create_table "favorites", force: true do |t|
    t.integer  "registry_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["registry_id"], name: "index_favorites_on_registry_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "guests_registries", id: false, force: true do |t|
    t.integer "guest_id",    null: false
    t.integer "registry_id", null: false
  end

  add_index "guests_registries", ["guest_id", "registry_id"], name: "index_guests_registries_on_guest_id_and_registry_id", using: :btree
  add_index "guests_registries", ["registry_id", "guest_id"], name: "index_guests_registries_on_registry_id_and_guest_id", using: :btree

  create_table "inquirers", force: true do |t|
    t.string   "name"
    t.string   "partner_name"
    t.string   "email"
    t.string   "preferred_contact_method"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", force: true do |t|
    t.string   "name",                                  null: false
    t.text     "description"
    t.decimal  "price",         precision: 9, scale: 2, null: false
    t.string   "thumbnail_img"
    t.integer  "project_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "item_types", ["project_id", "name", "price"], name: "index_item_types_on_project_id_and_name_and_price", unique: true, using: :btree
  add_index "item_types", ["project_id"], name: "index_item_types_on_project_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "item_type_id", null: false
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "registry_id"
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree
  add_index "items", ["purchase_id"], name: "index_items_on_purchase_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "email"
    t.integer  "registry_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "total"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "summary"
    t.text     "message"
    t.string   "recipient_first_name"
    t.string   "recipient_last_name"
    t.string   "recipient_email"
    t.string   "receipt_number"
    t.datetime "delivery_date"
  end

  create_table "organizations", force: true do |t|
    t.string   "name",                                 null: false
    t.text     "description"
    t.string   "profile_img"
    t.string   "org_url"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_price_range"
    t.string   "sectors"
    t.text     "mission_statement"
    t.boolean  "tax_exempt"
    t.string   "city_province"
    t.string   "country"
    t.string   "annual_budget"
    t.string   "ranked_charity"
    t.text     "referral_source"
    t.boolean  "heartfully_approved",  default: false
    t.string   "entity_if_not_503"
    t.string   "contact_name"
    t.string   "contact_job_title"
    t.string   "contact_email"
    t.string   "contact_phone_number"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "source_id"
  end

  add_index "organizations", ["admin_id"], name: "index_organizations_on_admin_id", using: :btree

  create_table "partner_invites", force: true do |t|
    t.string   "first_name",                    null: false
    t.string   "last_name",                     null: false
    t.string   "email",                         null: false
    t.integer  "registry_id",                   null: false
    t.string   "invitation_digest", limit: 128
    t.datetime "accepted_at"
    t.datetime "invalidated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partner_invites", ["registry_id"], name: "index_partner_invites_on_registry_id", using: :btree

  create_table "project_categories", force: true do |t|
    t.integer  "project_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_categories", ["category_id"], name: "index_project_categories_on_category_id", using: :btree
  add_index "project_categories", ["project_id"], name: "index_project_categories_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",                                                                     null: false
    t.string   "partner"
    t.text     "description"
    t.string   "url_slug"
    t.string   "banner_img"
    t.string   "city"
    t.string   "country",                                                                  null: false
    t.decimal  "funding_goal",                     precision: 11, scale: 2
    t.datetime "closed_at"
    t.boolean  "public",                                                    default: true, null: false
    t.integer  "organization_id",                                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_photo"
    t.string   "project_photo_2"
    t.string   "project_photo_3"
    t.text     "extra_content"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone_number"
    t.string   "sector"
    t.text     "overview"
    t.text     "problem"
    t.text     "solution"
    t.string   "how_it_works_step1",   limit: 350
    t.string   "how_it_works_step2",   limit: 350
    t.string   "how_it_works_step3",   limit: 350
    t.string   "how_it_works_step4",   limit: 350
    t.string   "how_it_works_step5",   limit: 350
    t.text     "importance"
    t.text     "sustainability"
    t.string   "staff_quote"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.string   "photo4_content_type"
    t.integer  "photo4_file_size"
    t.datetime "photo4_updated_at"
    t.string   "photo5_file_name"
    t.string   "photo5_content_type"
    t.integer  "photo5_file_size"
    t.datetime "photo5_updated_at"
    t.boolean  "certified"
    t.string   "budget_file_name"
    t.string   "budget_content_type"
    t.integer  "budget_file_size"
    t.datetime "budget_updated_at"
    t.integer  "source_id"
  end

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
    t.string   "url_slug",                   null: false
    t.text     "campaign_message"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "couples_story"
    t.text     "registry_story"
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "city_state"
    t.date     "event_date"
    t.string   "email"
    t.string   "type"
    t.string   "tweet"
    t.string   "registrant_first_name"
    t.string   "registrant_last_name"
    t.string   "registrant_type"
    t.string   "partner_first_name"
    t.string   "partner_last_name"
    t.string   "partner_type"
    t.string   "video_url"
    t.integer  "goal"
    t.string   "event_type"
  end

  add_index "registries", ["url_slug"], name: "index_registries_on_url_slug", unique: true, using: :btree

  create_table "registry_projects", force: true do |t|
    t.integer  "registry_id", null: false
    t.integer  "project_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registry_projects", ["project_id"], name: "index_registry_projects_on_project_id", using: :btree
  add_index "registry_projects", ["registry_id"], name: "index_registry_projects_on_registry_id", using: :btree

  create_table "reminders", force: true do |t|
    t.string "name"
    t.string "email"
    t.date   "reminder_date"
  end

  create_table "reports", force: true do |t|
    t.integer  "number_of_benefitters"
    t.integer  "number_of_communities_served"
    t.integer  "number_of_trainings_complete"
    t.string   "number_of_buildings_constructed"
    t.string   "other_benefits"
    t.text     "impact_measurement"
    t.text     "forward_steps"
    t.text     "thank_you_message"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.string   "photo4_content_type"
    t.integer  "photo4_file_size"
    t.datetime "photo4_updated_at"
    t.string   "photo5_file_name"
    t.string   "photo5_content_type"
    t.integer  "photo5_file_size"
    t.datetime "photo5_updated_at"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                           null: false
    t.string   "password_digest",     limit: 128,                 null: false
    t.string   "remember_digest",     limit: 128
    t.string   "reset_digest",        limit: 128
    t.datetime "reset_sent_at"
    t.string   "confirmation_digest", limit: 128
    t.datetime "confirmed_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_img"
    t.integer  "registry_id"
    t.integer  "organization_id"
    t.boolean  "system_admin",                    default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["registry_id"], name: "index_users_on_registry_id", using: :btree

end
