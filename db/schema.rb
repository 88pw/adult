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

ActiveRecord::Schema.define(version: 20170408114608) do

  create_table "actresses", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "initial"
    t.integer  "bust"
    t.integer  "waist"
    t.integer  "hip"
    t.integer  "height"
    t.date     "birth"
    t.string   "blood_type"
    t.string   "ruby"
    t.string   "birth_place"
    t.string   "image_lg"
    t.string   "image_sm"
    t.string   "dmm_id"
    t.integer  "sex",         default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",         null: false
    t.text     "description"
    t.integer  "actress_id",    null: false
    t.string   "thumbnail_url"
    t.float    "review_score"
    t.string   "service_url",   null: false
    t.integer  "service_id"
    t.string   "ad_url"
    t.integer  "series_id"
    t.integer  "director_id"
    t.integer  "label_id"
    t.integer  "maker_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["actress_id"], name: "index_posts_on_actress_id"
  end

end
