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

ActiveRecord::Schema.define(version: 20160220102847) do

  create_table "api_keys", force: :cascade do |t|
    t.integer  "profile_id", limit: 4,   null: false
    t.string   "salt",       limit: 128
    t.string   "api_key",    limit: 40
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "api_keys", ["profile_id"], name: "index_api_keys_on_profile_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "important_items", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "experience",                default: false
    t.boolean  "activity",                  default: true
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "important_items", ["experience"], name: "index_important_items_on_experience", using: :btree
  add_index "important_items", ["name"], name: "index_important_items_on_name", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "rarity",      limit: 4
    t.integer  "hierarchy",   limit: 4
    t.integer  "price",       limit: 4,     default: 0
    t.integer  "exp",         limit: 4,     default: 0
    t.boolean  "experience",                default: false
    t.boolean  "activity",                  default: true
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", unique: true, using: :btree
  add_index "items", ["rarity", "experience"], name: "index_items_on_rarity_and_experience", using: :btree

  create_table "materials", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "rarity",      limit: 4
    t.integer  "hierarchy",   limit: 4
    t.integer  "price",       limit: 4,     default: 0
    t.integer  "exp",         limit: 4,     default: 0
    t.boolean  "experience",                default: false
    t.boolean  "activity",                  default: true
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "materials", ["category_id"], name: "index_materials_on_category_id", using: :btree
  add_index "materials", ["name"], name: "index_materials_on_name", unique: true, using: :btree
  add_index "materials", ["rarity", "experience"], name: "index_materials_on_rarity_and_experience", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "level",      limit: 4, default: 1
    t.integer  "total_exp",  limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "item_id",       limit: 4, null: false
    t.integer  "materials1_id", limit: 4
    t.integer  "materials2_id", limit: 4
    t.integer  "items_id",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "recipes", ["item_id"], name: "index_recipes_on_item_id", using: :btree
  add_index "recipes", ["materials1_id", "materials2_id"], name: "index_recipes_on_materials1_id_and_materials2_id", using: :btree
  add_index "recipes", ["materials2_id"], name: "fk_rails_88760f97fd", using: :btree

  add_foreign_key "api_keys", "profiles"
  add_foreign_key "items", "categories"
  add_foreign_key "materials", "categories"
  add_foreign_key "recipes", "items"
  add_foreign_key "recipes", "materials", column: "materials1_id"
  add_foreign_key "recipes", "materials", column: "materials2_id"
end
