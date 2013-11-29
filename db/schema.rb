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

ActiveRecord::Schema.define(version: 20131127133716) do

  create_table "Adresses", force: true do |t|
    t.integer "Users_id"
    t.string  "house_name", limit: 30, null: false
    t.string  "first_line", limit: 30
    t.string  "area",       limit: 30, null: false
    t.string  "city",       limit: 50, null: false
    t.string  "postcode",   limit: 10, null: false
  end

  create_table "Menu_Item", force: true do |t|
    t.integer "Orders_id"
    t.string  "name",        default: "Yummy Burger", null: false
    t.text    "description",                          null: false
    t.integer "spice_level"
    t.integer "price",                                null: false
  end

  create_table "Order_History", force: true do |t|
    t.integer  "Users_id"
    t.integer  "Orders_id"
    t.integer  "paid",          default: 0,                     null: false
    t.datetime "time_of_order", default: '2013-11-27 14:09:35', null: false
    t.integer  "delivered",     default: 0,                     null: false
    t.integer  "satisfaction"
  end

  create_table "Orders", force: true do |t|
    t.datetime "time_of_order",    default: '2013-11-27 14:09:36', null: false
    t.integer  "menu_item_id",                                     null: false
    t.integer  "order_history_id",                                 null: false
  end

  create_table "Users", force: true do |t|
    t.string "first_name", limit: 30, null: false
    t.string "lastname",   limit: 30, null: false
    t.string "telephone",  limit: 15, null: false
    t.string "email",      limit: 50, null: false
  end

end
