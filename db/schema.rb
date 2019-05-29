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

ActiveRecord::Schema.define(version: 2019_05_29_125048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.boolean "am"
    t.boolean "pm"
    t.integer "total_price"
    t.string "status", default: "pending"
    t.bigint "user_id"
    t.bigint "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_bookings_on_desk_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "desk_features", force: :cascade do |t|
    t.integer "value"
    t.bigint "feature_id"
    t.bigint "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_desk_features_on_desk_id"
    t.index ["feature_id"], name: "index_desk_features_on_feature_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.integer "price"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.boolean "active", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_desks_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "numerical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_name"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data"
    t.index ["desk_id"], name: "index_photos_on_desk_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "desk_rating"
    t.integer "user_rating"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "host", default: false
    t.string "photo"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "desks"
  add_foreign_key "bookings", "users"
  add_foreign_key "desk_features", "desks"
  add_foreign_key "desk_features", "features"
  add_foreign_key "desks", "users"
  add_foreign_key "photos", "desks"
  add_foreign_key "reviews", "bookings"
end
