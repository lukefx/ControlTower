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

ActiveRecord::Schema.define(version: 20130704145202) do

  create_table "applications", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "context_root"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deployments", force: true do |t|
    t.integer  "server_id"
    t.integer  "version_id"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", force: true do |t|
    t.string   "name"
    t.string   "dns"
    t.string   "ip"
    t.string   "remote_path"
    t.text     "description"
    t.string   "username"
    t.string   "password"
    t.text     "configuration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.text     "changelog"
    t.integer  "application_id"
    t.string   "deployable_file_name"
    t.string   "deployable_content_type"
    t.integer  "deployable_file_size"
    t.datetime "deployable_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
