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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_022702) do
  create_table "authentications", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "scene", default: 0, null: false
    t.string "current_location"
    t.string "point_of_view"
    t.integer "emotional_value"
    t.text "body"
    t.integer "scene_type", default: 0, null: false
    t.integer "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_start"
    t.datetime "time_end"
    t.string "title"
    t.index ["plot_id"], name: "index_cards_on_plot_id"
  end

  create_table "character_knows", force: :cascade do |t|
    t.integer "character_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_character_knows_on_card_id"
    t.index ["character_id"], name: "index_character_knows_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "appearance"
    t.string "occupation"
    t.text "personality"
    t.text "motivation"
    t.text "relationship"
    t.string "role"
    t.string "avatar"
    t.index ["plot_id"], name: "index_characters_on_plot_id"
  end

  create_table "chat_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "input"
    t.text "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_logs_on_user_id"
  end

  create_table "eighteen_lines", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "explanation"
    t.string "body"
    t.integer "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_eighteen_lines_on_plot_id"
  end

  create_table "foreshadowing_cards", force: :cascade do |t|
    t.integer "foreshadowing_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_foreshadowing_cards_on_card_id"
    t.index ["foreshadowing_id"], name: "index_foreshadowing_cards_on_foreshadowing_id"
  end

  create_table "foreshadowings", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_foreshadowings_on_plot_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "plot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_notes_on_plot_id"
  end

  create_table "notification_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "notification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_notification_users_on_notification_id"
    t.index ["user_id"], name: "index_notification_users_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plots", force: :cascade do |t|
    t.string "name"
    t.string "theme"
    t.string "one_line"
    t.integer "color", default: 0, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "length_type", default: 0, null: false
    t.datetime "timeline"
    t.integer "person", default: 0, null: false
    t.string "slug"
    t.integer "accessibility", default: 0
    t.index ["slug"], name: "index_plots_on_slug", unique: true
    t.index ["user_id"], name: "index_plots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutorial_status", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "cards", "plots"
  add_foreign_key "character_knows", "cards"
  add_foreign_key "character_knows", "characters"
  add_foreign_key "characters", "plots"
  add_foreign_key "chat_logs", "users"
  add_foreign_key "eighteen_lines", "plots"
  add_foreign_key "foreshadowing_cards", "cards"
  add_foreign_key "foreshadowing_cards", "foreshadowings"
  add_foreign_key "foreshadowings", "plots"
  add_foreign_key "notes", "plots"
  add_foreign_key "notification_users", "notifications"
  add_foreign_key "notification_users", "users"
  add_foreign_key "plots", "users"
end
