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

ActiveRecord::Schema.define(version: 20180203191524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "allbecauseyoutoldmeso@yahoo.co.uk", null: false
    t.string "encrypted_password", default: "wax!", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "what"
    t.string "where"
    t.integer "day"
    t.time "start_time"
    t.text "freetext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.time "end_time"
  end

  create_table "photo_placers", force: :cascade do |t|
    t.bigint "photo_id"
    t.string "place"
    t.string "url"
    t.index ["photo_id"], name: "index_photo_placers_on_photo_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "hidden"
  end

  create_table "pranavs", force: :cascade do |t|
    t.text "about"
    t.string "telephone_number"
    t.string "email_address"
    t.string "twitter_url"
    t.string "facebook_url"
  end

  create_table "videos", force: :cascade do |t|
    t.string "caption"
    t.string "you_tube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
