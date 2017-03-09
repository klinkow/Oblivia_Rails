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

ActiveRecord::Schema.define(version: 20170308000322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "color"
    t.string   "nerd_type"
    t.integer  "score"
    t.integer  "latest_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "answer_correct"
    t.string   "answers_all"
    t.string   "correct_response"
    t.string   "wrong_response"
    t.integer  "number"
    t.string   "topic"
    t.integer  "round"
    t.string   "player"
    t.boolean  "fitb"
    t.boolean  "mc"
    t.boolean  "tf"
    t.boolean  "finished"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
