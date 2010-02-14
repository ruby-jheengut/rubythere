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

ActiveRecord::Schema.define(:version => 20100214081229) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.text     "description_formatted"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "cfp_date"
    t.datetime "reg_date"
    t.datetime "cfp_close_date"
    t.decimal  "cost",                  :precision => 10, :scale => 2, :default => 0.0
    t.string   "currency"
    t.boolean  "sold_out",                                             :default => false
    t.boolean  "childcare",                                            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "venue_id"
    t.string   "twitter"
    t.boolean  "reg_open",                                             :default => false
    t.boolean  "proposals_open",                                       :default => false
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "street_address2"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
