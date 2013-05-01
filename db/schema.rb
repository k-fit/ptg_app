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

ActiveRecord::Schema.define(:version => 20130424042108) do

  create_table "clearports", :force => true do |t|
    t.string   "trade_id"
    t.string   "report_id"
    t.string   "execution_id"
    t.string   "trade_match_id"
    t.string   "trade_date"
    t.integer  "trade_type"
    t.string   "instrument_id"
    t.string   "sec_type"
    t.string   "future_month"
    t.integer  "report_side"
    t.float    "price"
    t.float    "quantity"
    t.string   "quantity_type"
    t.string   "CME_broker"
    t.string   "broker"
    t.string   "trader"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "localtrades", :force => true do |t|
    t.boolean  "buy"
    t.string   "contract_type"
    t.string   "settlement"
    t.float    "volume"
    t.float    "price"
    t.string   "broker"
    t.boolean  "commission"
    t.string   "trader"
    t.integer  "user_id"
    t.date     "trade_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "localtrades", ["user_id", "trade_date"], :name => "index_localtrades_on_user_id_and_trade_date"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
