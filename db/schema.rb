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

ActiveRecord::Schema.define(version: 20170710081607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aisles", force: :cascade do |t|
    t.integer "aisle_number"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_aisles_on_store_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_reviews", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.integer "rating"
    t.bigint "user_id"
    t.index ["item_id"], name: "index_item_reviews_on_item_id"
    t.index ["user_id"], name: "index_item_reviews_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.decimal "sale_price"
    t.integer "quantity"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "store_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_item_id"], name: "index_reviews_on_store_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rows", force: :cascade do |t|
    t.integer "row_number"
    t.bigint "aisle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aisle_id"], name: "index_rows_on_aisle_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.integer "category_id"
    t.decimal "min_price"
    t.decimal "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_searches_on_store_id"
  end

  create_table "shelf_items", force: :cascade do |t|
    t.bigint "shelf_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_shelf_items_on_item_id"
    t.index ["shelf_id"], name: "index_shelf_items_on_shelf_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.integer "shelf_number"
    t.bigint "row_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["row_id"], name: "index_shelves_on_row_id"
    t.index ["store_id"], name: "index_shelves_on_store_id"
  end

  create_table "store_items", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_store_items_on_item_id"
    t.index ["store_id"], name: "index_store_items_on_store_id"
  end

  create_table "store_reviews", force: :cascade do |t|
    t.text "body"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_reviews_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "street_address"
    t.string "province"
    t.string "postal_code"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cid"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "is_admin?"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "aisles", "stores"
  add_foreign_key "item_reviews", "items"
  add_foreign_key "item_reviews", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "reviews", "store_items"
  add_foreign_key "reviews", "users"
  add_foreign_key "rows", "aisles"
  add_foreign_key "searches", "stores"
  add_foreign_key "shelf_items", "items"
  add_foreign_key "shelf_items", "shelves"
  add_foreign_key "shelves", "rows"
  add_foreign_key "shelves", "stores"
  add_foreign_key "store_items", "items"
  add_foreign_key "store_items", "stores"
  add_foreign_key "store_reviews", "stores"
end
