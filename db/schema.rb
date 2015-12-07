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

ActiveRecord::Schema.define(version: 20151206235705) do

  create_table "barcodes", force: :cascade do |t|
    t.string   "code",          null: false
    t.integer  "store_item_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "barcodes", ["store_item_id"], name: "index_barcodes_on_store_item_id"

  create_table "blog_comments", force: :cascade do |t|
    t.text     "content",      null: false
    t.integer  "blog_post_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "blog_comments", ["blog_post_id"], name: "index_blog_comments_on_blog_post_id"
  add_index "blog_comments", ["user_id"], name: "index_blog_comments_on_user_id"

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.string   "language",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blog_posts", ["user_id"], name: "index_blog_posts_on_user_id"

  create_table "pricing_defaults", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.text     "transform",   null: false
    t.integer  "priority",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pricing_defaults_user_groups", force: :cascade do |t|
    t.integer "pricing_default_id", null: false
    t.integer "user_group_id",      null: false
  end

  add_index "pricing_defaults_user_groups", ["pricing_default_id"], name: "index_pricing_defaults_user_groups_on_pricing_default_id"
  add_index "pricing_defaults_user_groups", ["user_group_id"], name: "index_pricing_defaults_user_groups_on_user_group_id"

  create_table "pricing_overrides", force: :cascade do |t|
    t.text     "transform",          null: false
    t.integer  "payable_id",         null: false
    t.string   "payable_type",       null: false
    t.integer  "pricing_default_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "pricing_overrides", ["payable_type", "payable_id"], name: "index_pricing_overrides_on_payable_type_and_payable_id"
  add_index "pricing_overrides", ["pricing_default_id"], name: "index_pricing_overrides_on_pricing_default_id"

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "website",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_item_classes", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "parent_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "store_item_classes", ["parent_id"], name: "index_store_item_classes_on_parent_id"

  create_table "store_items", force: :cascade do |t|
    t.string   "name",                                        null: false
    t.integer  "stock",                                       null: false
    t.integer  "store_item_class_id",                         null: false
    t.decimal  "purchase_price",      precision: 8, scale: 2, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "store_items", ["store_item_class_id"], name: "index_store_items_on_store_item_class_id"

  create_table "user_groups", force: :cascade do |t|
    t.string   "name",                null: false
    t.text     "description",         null: false
    t.integer  "pricing_override_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "user_groups", ["pricing_override_id"], name: "index_user_groups_on_pricing_override_id"

  create_table "user_groups_users", id: false, force: :cascade do |t|
    t.integer "user_group_id", null: false
    t.integer "user_id",       null: false
  end

  add_index "user_groups_users", ["user_group_id"], name: "index_user_groups_users_on_user_group_id"
  add_index "user_groups_users", ["user_id"], name: "index_user_groups_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                                    null: false
    t.string   "first_name",                                                  null: false
    t.string   "last_name",                                                   null: false
    t.boolean  "payed"
    t.decimal  "account_balance",        precision: 8, scale: 2
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
