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

ActiveRecord::Schema.define(version: 20160312122220) do

  create_table "books", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.string   "itemName",       limit: 255
    t.string   "releaseDate",    limit: 255
    t.string   "ageRequirement", limit: 255
    t.string   "author",         limit: 255
    t.string   "translator",     limit: 255
    t.string   "publisher",      limit: 255
    t.string   "seller",         limit: 255
    t.string   "type",           limit: 255
    t.string   "pages",          limit: 255
    t.string   "isbn10",         limit: 255
    t.string   "isbn13",         limit: 255
    t.string   "lang",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "books", ["isbn10"], name: "index_books_on_isbn10", unique: true, using: :btree
  add_index "books", ["isbn13"], name: "index_books_on_isbn13", unique: true, using: :btree
  add_index "books", ["product_id"], name: "index_books_on_product_id", unique: true, using: :btree

  create_table "foods", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.string   "itemName",       limit: 255
    t.string   "releaseDate",    limit: 255
    t.string   "ageRequirement", limit: 255
    t.string   "maker",          limit: 255
    t.string   "seller",         limit: 255
    t.string   "brand",          limit: 255
    t.string   "dimension",      limit: 255
    t.string   "weight",         limit: 255
    t.string   "quantity",       limit: 255
    t.string   "preservation",   limit: 255
    t.string   "producingArea",  limit: 255
    t.string   "ean13",          limit: 255
    t.string   "ean8",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "foods", ["ean13"], name: "index_foods_on_ean13", unique: true, using: :btree
  add_index "foods", ["ean8"], name: "index_foods_on_ean8", unique: true, using: :btree
  add_index "foods", ["product_id"], name: "index_foods_on_product_id", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "price",      limit: 4
    t.string   "item_id",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "products", ["item_id"], name: "index_products_on_item_id", unique: true, using: :btree

end
