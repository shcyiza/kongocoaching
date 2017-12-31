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

ActiveRecord::Schema.define(version: 20171220174325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "ad_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ad_media", force: :cascade do |t|
    t.string   "name"
    t.integer  "ad_category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["ad_category_id"], name: "index_ad_media_on_ad_category_id", using: :btree
  end

  create_table "ad_reaches", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "ad_medium_id"
    t.integer  "advertisable_id"
    t.string   "advertisable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["ad_medium_id"], name: "index_ad_reaches_on_ad_medium_id", using: :btree
    t.index ["profile_id"], name: "index_ad_reaches_on_profile_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "annoncements", force: :cascade do |t|
    t.integer  "crew_id"
    t.string   "titel"
    t.string   "cta"
    t.text     "description"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["crew_id"], name: "index_annoncements_on_crew_id", using: :btree
  end

  create_table "avatars", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "is_default",         default: false
    t.string   "vignette"
  end

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
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_hq",      default: false
    t.index ["club_id"], name: "index_clubs_crews_on_club_id", using: :btree
    t.index ["crew_id"], name: "index_clubs_crews_on_crew_id", using: :btree
  end

  create_table "coaches", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "coaches_crews", force: :cascade do |t|
    t.integer  "coach_id"
    t.integer  "crew_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  create_table "confirmations", force: :cascade do |t|
    t.boolean  "confirmed",        default: false
    t.string   "confirmable_type"
    t.integer  "confirmable_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "confirmed_by"
  end

  create_table "coordinators", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crew_storefront_keys", force: :cascade do |t|
    t.integer  "crew_id"
    t.string   "public_key"
    t.string   "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_crew_storefront_keys_on_crew_id", using: :btree
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

  create_table "news_subscribers", force: :cascade do |t|
    t.string   "email"
    t.integer  "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_news_subscribers_on_crew_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "enrollable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "enrollable_type"
  end

  create_table "profile_ideal_shedulings", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "weekday"
    t.integer  "dayperiod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_ideal_shedulings_on_profile_id", using: :btree
  end

  create_table "profile_kids_infos", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "birthyear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_kids_infos_on_profile_id", using: :btree
  end

  create_table "profile_ready_tos", force: :cascade do |t|
    t.integer  "profile_id"
    t.boolean  "work_on_diet"
    t.boolean  "work_physically"
    t.boolean  "work_on_lifestyle"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["profile_id"], name: "index_profile_ready_tos_on_profile_id", using: :btree
  end

  create_table "profile_shape_satifactions", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "shape_rating"
    t.boolean  "shape_satification"
    t.integer  "current_activity_frequency"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["profile_id"], name: "index_profile_shape_satifactions_on_profile_id", using: :btree
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
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "crew_id"
    t.string   "phonenr"
    t.text     "motivation"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "proffesion"
    t.string   "emergency_contact"
    t.string   "emergency_contact_relation"
    t.string   "emergency_contact_phone"
    t.string   "dr_name"
    t.string   "dr_phone"
    t.string   "proffession_address"
    t.float    "proffession_latitude"
    t.float    "proffession_longitude"
    t.index ["coaches_crew_id"], name: "index_profiles_on_coaches_crew_id", using: :btree
    t.index ["crew_id"], name: "index_profiles_on_crew_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "social_links", force: :cascade do |t|
    t.string   "url"
    t.integer  "social_medium_id"
    t.string   "socilizable_type"
    t.integer  "socializable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["social_medium_id"], name: "index_social_links_on_social_medium_id", using: :btree
  end

  create_table "social_media", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "specialties", force: :cascade do |t|
    t.integer  "training_type_id"
    t.integer  "specializable_id"
    t.string   "specializable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["training_type_id"], name: "index_specialties_on_training_type_id", using: :btree
  end

  create_table "sudos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sudos_on_user_id", using: :btree
  end

  create_table "training_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration_hours"
    t.integer  "duration_minutes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "crew_id"
    t.index ["crew_id"], name: "index_training_types_on_crew_id", using: :btree
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
    t.string   "provider"
    t.string   "uid"
    t.text     "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "video_links", force: :cascade do |t|
    t.string   "video_path"
    t.integer  "watchable_id"
    t.string   "watchable_type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_default",     default: false
  end

  add_foreign_key "ad_media", "ad_categories"
  add_foreign_key "ad_reaches", "ad_media"
  add_foreign_key "ad_reaches", "profiles"
  add_foreign_key "annoncements", "crews"
  add_foreign_key "clubs_crews", "clubs"
  add_foreign_key "clubs_crews", "crews"
  add_foreign_key "crew_storefront_keys", "crews"
  add_foreign_key "kickstarts", "coaches_crews"
  add_foreign_key "kickstarts", "crews"
  add_foreign_key "news_subscribers", "crews"
  add_foreign_key "profile_ideal_shedulings", "profiles"
  add_foreign_key "profile_kids_infos", "profiles"
  add_foreign_key "profile_ready_tos", "profiles"
  add_foreign_key "profile_shape_satifactions", "profiles"
  add_foreign_key "profile_variables", "profiles"
  add_foreign_key "profiles", "coaches_crews"
  add_foreign_key "profiles", "crews"
  add_foreign_key "profiles", "users"
  add_foreign_key "social_links", "social_media"
  add_foreign_key "specialties", "training_types"
  add_foreign_key "sudos", "users"
  add_foreign_key "training_types", "crews"
end
