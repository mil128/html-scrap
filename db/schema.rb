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

ActiveRecord::Schema.define(:version => 20120217105751) do

  create_table "scraps", :force => true do |t|
    t.string   "order_id"
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
    t.datetime "from_date"
    t.datetime "to_date"
  end

end
