class CreateStructure < ActiveRecord::Migration
  def change

    create_table "active_admin_comments" do |t|
      t.string   "namespace"
      t.text     "body"
      t.string   "resource_id",   null: false
      t.string   "resource_type", null: false
      t.integer  "author_id"
      t.string   "author_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
    add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

    # Could not dump table "jdr_autoparse_venoms" because of following NoMethodError
    #   undefined method `[]' for nil:NilClass

    create_table "manual_venoms" do |t|
      t.text     "venom"
      t.text     "effect"
      t.text     "pmid"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean  "status"
    end

    create_table "jdr_autoparse_venoms" do |t|
      t.text     "venom"
      t.text     "effect"
      t.text     "pmid"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean  "status"
    end

    create_table "smdb_search_venoms" do |t|
      t.string   "compound"
      t.string   "predicate"
      t.string   "object"
      t.string   "pmid"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean  "status"
    end

    create_table "users" do |t|
      t.string   "name"
      t.string   "email"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.string   "password_digest"
      t.string   "remember_digest"
      t.boolean  "admin",           default: false
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true

  end

end
