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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120410135753) do

  create_table "goals", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "headlines", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "indicators", :force => true do |t|
    t.integer  "headline_id"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "indicators_partners", :id => false, :force => true do |t|
    t.integer "partner_id"
    t.integer "indicator_id"
  end

  create_table "indicators_targets", :id => false, :force => true do |t|
    t.integer "target_id"
    t.integer "indicator_id"
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "targets", :force => true do |t|
    t.integer  "goal_id"
    t.integer  "index"
    t.string   "keyword"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
