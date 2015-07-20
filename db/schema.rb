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

ActiveRecord::Schema.define(version: 20150720073547) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "category_string", limit: 255
  end

  create_table "experts", force: :cascade do |t|
    t.string   "handle",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "category_string", limit: 255
  end

  create_table "sinces", force: :cascade do |t|
    t.string   "since_value", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "handle",          limit: 255
    t.string   "tweet_text",      limit: 1000
    t.string   "string",          limit: 1000
    t.string   "tweet_embed",     limit: 1000
    t.boolean  "is_retweet",      limit: 1
    t.boolean  "has_link",        limit: 1
    t.boolean  "has_image",       limit: 1
    t.boolean  "is_reply",        limit: 1
    t.boolean  "has_hashtags",    limit: 1
    t.string   "hashtags",        limit: 255
    t.string   "geo",             limit: 255
    t.string   "language",        limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "category_string", limit: 255
  end

end
