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

ActiveRecord::Schema.define(:version => 20120229114046) do

  create_table "borrowers", :force => true do |t|
    t.integer  "loan_id"
    t.integer  "field_partner_id"
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.string   "photo"
    t.string   "profile_image"
    t.string   "village"
    t.string   "taluka"
    t.string   "state"
    t.text     "story",            :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expiry_date"
  end

  add_index "borrowers", ["name"], :name => "index_borrowers_on_name"

  create_table "detail_matches", :force => true do |t|
    t.string   "order_id"
    t.string   "order_status"
    t.string   "order_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detail_matches", ["order_id"], :name => "fk_scraps"

  create_table "facebook_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "identifier"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id"
  end

  create_table "field_partners", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gmail_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.float    "amount"
    t.float    "amount_funded"
    t.float    "amount_in_rupees"
    t.integer  "loan_term"
    t.string   "repayment_period"
    t.float    "installments"
    t.integer  "borrower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "amount_repaid"
    t.string   "title"
    t.string   "category"
    t.text     "your_impact"
    t.datetime "expiry_date"
    t.float    "interest_rate"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "openid_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.string   "user_id"
    t.integer  "borrower_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repayments", :force => true do |t|
    t.integer  "borrower_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "run_dates", :force => true do |t|
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scraps", :primary_key => "order_id", :force => true do |t|
    t.datetime "order_date"
    t.float    "order_amt"
    t.string   "order_status"
    t.string   "payment_mode"
    t.string   "mil_tx_id"
    t.string   "order_desc"
    t.integer  "borrower_id"
    t.string   "borrower_name"
    t.string   "cust_name"
    t.string   "cust_email"
    t.string   "cust_phone"
    t.text     "cust_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
  end

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "track", :id => false, :force => true do |t|
    t.string  "song",     :null => false
    t.integer "order_id"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "borrower_id"
    t.float    "amount"
    t.float    "tax_paid"
    t.float    "total_amount"
    t.string   "status"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "credits"
  end

  create_table "troys", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.float    "amount_loaned"
    t.string   "twitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "loan_paid"
    t.float    "credits"
    t.string   "why_lend"
    t.string   "user_location"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
