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

ActiveRecord::Schema.define(:version => 20130305200511) do

  create_table "awards", :force => true do |t|
    t.integer  "contestant_id"
    t.integer  "badge_id"
    t.integer  "contestable_id"
    t.string   "contestable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "interval"
  end

  create_table "contest_days", :force => true do |t|
    t.integer  "contest_id"
    t.integer  "contest_week_id"
    t.integer  "day_id"
    t.datetime "created_at",                                                                           :null => false
    t.datetime "updated_at",                                                                           :null => false
    t.integer  "average_up_flights",                                                  :default => 0
    t.integer  "average_down_flights",                                                :default => 0
    t.integer  "average_total_flights",                                               :default => 0
    t.decimal  "average_up_flights_extended_value",    :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "average_down_flights_extended_value",  :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "average_total_flights_extended_value", :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "contest_weeks", :force => true do |t|
    t.integer  "contest_id"
    t.integer  "contest_week"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                                                                      :null => false
    t.datetime "updated_at",                                                                      :null => false
    t.integer  "user_id"
    t.integer  "average_number_of_flights_up",                                   :default => 0
    t.decimal  "average_extended_value_up",       :precision => 10, :scale => 2, :default => 0.0
    t.integer  "average_number_of_flights_down",                                 :default => 0
    t.decimal  "average_extended_value_down",     :precision => 10, :scale => 2, :default => 0.0
    t.integer  "average_number_of_flights_total",                                :default => 0
    t.decimal  "average_extended_value_total",    :precision => 10, :scale => 2, :default => 0.0
  end

  create_table "contestant_days", :force => true do |t|
    t.integer  "contestant_id"
    t.integer  "up_flights",                                                  :default => 0
    t.decimal  "up_flights_extended_value",    :precision => 10, :scale => 2, :default => 0.0
    t.integer  "down_flights",                                                :default => 0
    t.decimal  "down_flights_extended_value",  :precision => 10, :scale => 2, :default => 0.0
    t.integer  "total_flights",                                               :default => 0
    t.decimal  "total_flights_extended_value", :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
    t.integer  "contest_day_id"
    t.integer  "contest_week_id"
    t.integer  "contestant_week_id"
  end

  create_table "contestant_weeks", :force => true do |t|
    t.integer  "contestant_id"
    t.integer  "contest_week_id"
    t.integer  "up_flights",                                                  :default => 0
    t.decimal  "up_flights_extended_value",    :precision => 10, :scale => 2, :default => 0.0
    t.integer  "down_flights",                                                :default => 0
    t.decimal  "down_flights_extended_value",  :precision => 10, :scale => 2, :default => 0.0
    t.integer  "total_flights",                                               :default => 0
    t.decimal  "total_flights_extended_value", :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

  create_table "contests", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "registration_fee_cents",                                   :default => 0,     :null => false
    t.string   "registration_fee_currency",                                :default => "USD", :null => false
    t.decimal  "ascend_value",              :precision => 10, :scale => 2
    t.decimal  "descend_value",             :precision => 10, :scale => 2
    t.datetime "created_at",                                                                  :null => false
    t.datetime "updated_at",                                                                  :null => false
    t.text     "rules"
    t.integer  "number_of_weeks"
  end

  create_table "days", :force => true do |t|
    t.date     "date"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "cwday"
    t.integer  "cweek"
    t.integer  "yday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "measurements", :force => true do |t|
    t.string   "direction"
    t.integer  "number_of_flights"
    t.integer  "user_id"
    t.integer  "day_id"
    t.decimal  "extended_value",    :precision => 10, :scale => 2
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "talks", :force => true do |t|
    t.integer  "contestant_id"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contest_id"
    t.boolean  "registration_fee_paid"
    t.boolean  "accept_terms"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "role"
    t.string   "type"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "display_name"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
