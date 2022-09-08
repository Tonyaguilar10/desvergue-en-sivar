# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_08_051704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blue_cards", force: :cascade do |t|
    t.string "content"
    t.boolean "in_deck"
    t.boolean "drawn"
    t.boolean "used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gamerooms", force: :cascade do |t|
    t.integer "password"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gamerooms_on_user_id"
  end

  create_table "hands", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gameroom_id", null: false
    t.bigint "white_card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gameroom_id"], name: "index_hands_on_gameroom_id"
    t.index ["user_id"], name: "index_hands_on_user_id"
    t.index ["white_card_id"], name: "index_hands_on_white_card_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "sentence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "gameroom_id", null: false
    t.bigint "blue_card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blue_card_id"], name: "index_rounds_on_blue_card_id"
    t.index ["gameroom_id"], name: "index_rounds_on_gameroom_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "white_cards", force: :cascade do |t|
    t.string "content"
    t.boolean "in_deck"
    t.boolean "in_hand"
    t.boolean "drawn"
    t.boolean "used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "gamerooms", "users"
  add_foreign_key "hands", "gamerooms"
  add_foreign_key "hands", "users"
  add_foreign_key "hands", "white_cards"
  add_foreign_key "rounds", "blue_cards"
  add_foreign_key "rounds", "gamerooms"
end
