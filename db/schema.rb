# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091202030505) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "price"
    t.integer  "category_id"
    t.string   "condition"
    t.string   "zip_code"
    t.string   "shipping_options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "willing_to_ship"
    t.decimal  "shipping_cost",    :precision => 15, :scale => 2
    t.integer  "offers_count",                                    :default => 0
    t.integer  "questions_count",                                 :default => 0
  end

  add_index "listings", ["category_id"], :name => "index_listings_on_category_id"
  add_index "listings", ["user_id"], :name => "index_listings_on_user_id"

  create_table "offers", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.decimal  "amount",              :precision => 15, :scale => 2
    t.string   "pickup_availability"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["listing_id"], :name => "index_offers_on_listing_id"
  add_index "offers", ["user_id"], :name => "index_offers_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "photos", ["listing_id"], :name => "index_photos_on_listing_id"

  create_table "questions", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["listing_id"], :name => "index_questions_on_listing_id"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "reports", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["listing_id"], :name => "index_reports_on_listing_id"
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "zip_code"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
