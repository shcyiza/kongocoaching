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

ActiveRecord::Schema.define(version: 20170705164658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "clubs_crews", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_clubs_crews_on_club_id", using: :btree
    t.index ["crew_id"], name: "index_clubs_crews_on_crew_id", using: :btree
  end

  create_table "coaches", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaches_crews", force: :cascade do |t|
    t.integer  "coach_id"
    t.integer  "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crews", force: :cascade do |t|
    t.integer  "coordinator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
  end

  create_table "kickstarts", force: :cascade do |t|
    t.integer  "coaches_crew_id"
    t.integer  "crew_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["coaches_crew_id"], name: "index_kickstarts_on_coaches_crew_id", using: :btree
    t.index ["crew_id"], name: "index_kickstarts_on_crew_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "enrollable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "enrollable_type"
  end

  create_table "profile_variables", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.decimal  "variable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_variables_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coaches_crew_id"
    t.date     "birth_date"
    t.boolean  "sex"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "crew_id"
    t.string   "phonenr"
    t.text     "motivation"
    t.index ["coaches_crew_id"], name: "index_profiles_on_coaches_crew_id", using: :btree
    t.index ["crew_id"], name: "index_profiles_on_crew_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "training_types", force: :cascade do |t|
    t.string   "type"
    t.text     "description"
    t.integer  "duration_hours"
    t.integer  "duration_minutes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "coaches_crew_id"
    t.integer  "training_type_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "clubs_crews", "clubs"
  add_foreign_key "clubs_crews", "crews"
  add_foreign_key "kickstarts", "coaches_crews"
  add_foreign_key "kickstarts", "crews"
  add_foreign_key "profile_variables", "profiles"
  add_foreign_key "profiles", "coaches_crews"
  add_foreign_key "profiles", "crews"
  add_foreign_key "profiles", "users"
end
