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

ActiveRecord::Schema.define(version: 20151217231514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "white_score"
    t.integer  "blue_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "played_positions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "position_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["game_id"], name: "index_played_positions_on_game_id", using: :btree
    t.index ["player_id"], name: "index_played_positions_on_player_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_games", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "game_id"
    t.integer  "side_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["game_id"], name: "index_team_games_on_game_id", using: :btree
    t.index ["team_id"], name: "index_team_games_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "offense_id"
    t.integer  "defense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

end
