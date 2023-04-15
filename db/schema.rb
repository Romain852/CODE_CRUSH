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

ActiveRecord::Schema[7.0].define(version: 2023_04_15_045755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.string "category"
    t.integer "rating"
    t.text "syllabus"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "session_start"
    t.datetime "session_end"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrolments_on_course_id"
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "enrolment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrolment_id"], name: "index_reviews_on_enrolment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.integer "role"
    t.string "image_url"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "users"
  add_foreign_key "enrolments", "courses"
  add_foreign_key "enrolments", "users"
  add_foreign_key "reviews", "enrolments"
end
