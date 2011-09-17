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

ActiveRecord::Schema.define(:version => 20110917005537) do

  create_table "alternative_enclosures", :force => true do |t|
    t.integer   "enclosure_id"
    t.string    "alternative_file_name"
    t.string    "alternative_content_type"
    t.integer   "alternative_file_size"
    t.timestamp "alternative_updated_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "enclosures", :force => true do |t|
    t.integer   "post_id"
    t.string    "enclosure_file_name"
    t.string    "enclosure_content_type"
    t.integer   "enclosure_file_size"
    t.timestamp "enclosure_updated_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string    "text"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "playlists", :force => true do |t|
    t.integer   "post_id"
    t.integer   "number"
    t.string    "artist"
    t.string    "title"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string    "title"
    t.text      "body"
    t.boolean   "published"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.datetime  "published_at"
  end

  create_table "settings", :force => true do |t|
    t.string    "key"
    t.string    "value"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
