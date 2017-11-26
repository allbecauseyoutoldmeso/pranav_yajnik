ActiveRecord::Schema.define(version: 20171124181440) do

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
    t.time "time"
    t.text "freetext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
