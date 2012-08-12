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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120808233052) do

  create_table "climates", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crop_strains", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "crop_type_id"
    t.string   "extra_info"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "crop_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "crops", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "planted_date"
    t.integer  "crop_strain_id"
    t.integer  "seed_count"
    t.integer  "farm_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "farms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "farms", ["slug"], :name => "index_farms_on_slug"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "harvest_details", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "harvest_date"
    t.decimal  "total_wet_yield"
    t.decimal  "total_dry_yield"
    t.integer  "yield_unit_id"
    t.string   "notes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "journal_crops", :force => true do |t|
    t.integer  "journal_id"
    t.integer  "crop_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "journal_farms", :force => true do |t|
    t.integer  "journal_id"
    t.integer  "farm_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "journal_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "journals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "journal_type_id"
    t.boolean  "is_primary"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "journals", ["journal_type_id"], :name => "index_journals_on_journal_type_id"
  add_index "journals", ["slug", "user_id"], :name => "index_journals_on_slug_and_user_id"
  add_index "journals", ["slug"], :name => "index_journals_on_slug"
  add_index "journals", ["user_id"], :name => "index_journals_on_user_id"

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "journal_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "posts", ["journal_id"], :name => "index_posts_on_journal_id"
  add_index "posts", ["slug", "journal_id"], :name => "index_posts_on_slug_and_journal_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.string   "imgurl"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "climate_id"
    t.integer  "country_id"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "street"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.integer  "country_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "slug"
  end

  add_index "users", ["country_id"], :name => "index_users_on_country_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug"
  add_index "users", ["state_id"], :name => "index_users_on_state_id"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
