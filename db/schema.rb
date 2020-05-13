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

ActiveRecord::Schema.define(version: 20200513105215) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "event_name"
    t.string   "event_day"
    t.string   "performing_artist"
    t.string   "event_image"
    t.string   "event_place"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "set_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.string   "artist",       null: false
    t.string   "first_song",   null: false
    t.string   "second_song"
    t.string   "third_song"
    t.string   "fourth_song"
    t.string   "fifth_song"
    t.string   "sixth_song"
    t.string   "seventh_song"
    t.string   "eighth_song"
    t.string   "ninth_song"
    t.string   "tenth_song"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_set_lists_on_event_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
