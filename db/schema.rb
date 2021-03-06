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

ActiveRecord::Schema.define(version: 20150130104025) do

  create_table "changes", force: true do |t|
    t.integer  "variation_id", null: false
    t.string   "selector",     null: false
    t.string   "content"
    t.string   "css_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "changes", ["variation_id"], name: "index_changes_on_variation_id"

  create_table "experiments", force: true do |t|
    t.string   "title",                             null: false
    t.string   "status",          default: "draft", null: false
    t.datetime "published_until"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "variations", force: true do |t|
    t.integer  "experiment_id",    null: false
    t.string   "title",            null: false
    t.string   "population_logic", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variations", ["experiment_id"], name: "index_variations_on_experiment_id"

end
