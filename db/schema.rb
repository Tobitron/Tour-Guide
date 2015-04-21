ActiveRecord::Schema.define(version: 20150421155413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stops", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.float   "latitude",    null: false
    t.float   "longitude",   null: false
    t.integer "stop_length", null: false
  end

  create_table "tour_stops", force: :cascade do |t|
    t.integer "tour_id",     null: false
    t.integer "stop_id",     null: false
    t.integer "stop_number", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string  "name",     null: false
    t.integer "user_id",  null: false
    t.string  "category"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
