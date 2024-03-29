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

ActiveRecord::Schema.define(:version => 20130423172407) do

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.string   "comments"
    t.string   "guid"
    t.integer  "feed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "pubDate"
  end

  add_index "entries", ["feed_id"], :name => "index_entries_on_feed_id"
  add_index "entries", ["guid"], :name => "index_entries_on_guid", :unique => true

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
