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

ActiveRecord::Schema.define(version: 20160313001714) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id",                limit: 4
    t.string   "account_id",             limit: 255
    t.string   "branch_number",          limit: 255
    t.string   "account_type_cd",        limit: 255
    t.string   "account_type",           limit: 255
    t.string   "account_number",         limit: 255
    t.string   "account_holder_type_cd", limit: 255
    t.string   "account_holder_type",    limit: 255
    t.integer  "balance",                limit: 4
    t.date     "opening_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

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

  create_table "client_stores", force: :cascade do |t|
    t.integer  "client_id",  limit: 4
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

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

  create_table "product_stores", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "store_id",   limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "product_stores", ["store_id", "product_id"], name: "index_product_stores_on_store_id_and_product_id", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",           limit: 255, null: false
    t.string   "itemId",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "score",          limit: 24
    t.string   "imageUrl",       limit: 255
    t.string   "sites_url",      limit: 255
    t.string   "sites_title",    limit: 255
    t.string   "sites_imageUrl", limit: 255
  end

  add_index "products", ["itemId"], name: "index_products_on_itemId", unique: true, using: :btree

  create_table "purchase_informations", force: :cascade do |t|
    t.integer  "purchase_id",        limit: 4
    t.integer  "product_id",         limit: 4
    t.integer  "number_of_products", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "purchase_informations", ["purchase_id", "product_id"], name: "index_purchase_informations_on_purchase_id_and_product_id", unique: true, using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "store_id",      limit: 4
    t.integer  "total_amounts", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "shoppings", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "product_id",         limit: 4
    t.integer  "purchase_id",        limit: 4
    t.integer  "number_of_products", limit: 4
    t.string   "action",             limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "store_id",           limit: 4
  end

  create_table "stores", force: :cascade do |t|
    t.string   "user_name",              limit: 255
    t.string   "account_id",             limit: 255
    t.string   "branch_number",          limit: 255
    t.string   "account_type_cd",        limit: 255
    t.string   "account_type",           limit: 255
    t.string   "account_number",         limit: 255
    t.string   "account_holder_type_cd", limit: 255
    t.string   "account_holder_type",    limit: 255
    t.integer  "balance",                limit: 4
    t.date     "opening_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "user_id",                limit: 255
    t.string   "post_code",              limit: 255
    t.string   "address",                limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "email",                  limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id",                limit: 255
    t.string   "user_name",              limit: 255
    t.string   "post_code",              limit: 255
    t.string   "address",                limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "access_token",           limit: 255
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
