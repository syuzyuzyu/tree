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

ActiveRecord::Schema.define(version: 20161005125744) do

  create_table "experiences", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "experiences", ["micropost_id"], name: "index_experiences_on_micropost_id"
  add_index "experiences", ["person_id", "micropost_id"], name: "index_experiences_on_person_id_and_micropost_id", unique: true
  add_index "experiences", ["person_id"], name: "index_experiences_on_person_id"

  create_table "genes", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "bond_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genes", ["bond_id"], name: "index_genes_on_bond_id"
  add_index "genes", ["person_id", "bond_id", "type"], name: "index_genes_on_person_id_and_bond_id_and_type", unique: true
  add_index "genes", ["person_id"], name: "index_genes_on_person_id"

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invites", ["person_id"], name: "index_invites_on_person_id"
  add_index "invites", ["user_id", "person_id"], name: "index_invites_on_user_id_and_person_id", unique: true
  add_index "invites", ["user_id"], name: "index_invites_on_user_id"

  create_table "marriages", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "spouse_id"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marriages", ["person_id", "spouse_id"], name: "index_marriages_on_person_id_and_spouse_id", unique: true
  add_index "marriages", ["person_id"], name: "index_marriages_on_person_id"
  add_index "marriages", ["spouse_id"], name: "index_marriages_on_spouse_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.string   "image"
    t.boolean  "delete_flg"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["created_at"], name: "index_microposts_on_person_id_and_created_at"

  create_table "people", force: :cascade do |t|
    t.string   "image"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.date     "dead"
    t.integer  "gender"
    t.string   "birth_place"
    t.string   "city"
    t.string   "cuntry"
    t.text     "summary"
    t.string   "occupation"
    t.boolean  "delete_flg"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["person_id"], name: "index_users_on_person_id"

end
