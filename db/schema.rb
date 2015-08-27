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

ActiveRecord::Schema.define(version: 20150827063123) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_questions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.boolean  "q_1_1"
    t.boolean  "q_1_2"
    t.boolean  "q_1_3"
    t.boolean  "q_1_4"
    t.boolean  "q_1_5"
    t.boolean  "q_2_1"
    t.boolean  "q_2_2"
    t.boolean  "q_2_3"
    t.boolean  "q_2_4"
    t.boolean  "q_2_5"
    t.boolean  "q_3_1"
    t.boolean  "q_3_2"
    t.boolean  "q_3_3"
    t.boolean  "q_3_4"
    t.boolean  "q_3_5"
    t.boolean  "q_4_1"
    t.boolean  "q_4_2"
    t.boolean  "q_4_3"
    t.boolean  "q_4_4"
    t.boolean  "q_4_5"
    t.boolean  "q_5_1"
    t.boolean  "q_5_2"
    t.boolean  "q_5_3"
    t.boolean  "q_5_4"
    t.boolean  "q_5_5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "p1"
    t.integer  "p2"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "difficulty"
    t.integer  "points"
    t.boolean  "active_question"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "categoria"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
