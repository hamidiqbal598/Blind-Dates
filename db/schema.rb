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

ActiveRecord::Schema[7.0].define(version: 2023_04_14_104546) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "blind_dates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "team_id", null: false
    t.datetime "date"
    t.string "restaurant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_blind_dates_on_team_id"
  end

  create_table "employee_teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "employee_id", null: false
    t.uuid "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "team_id"], name: "index_employee_teams_on_employee_id_and_team_id"
    t.index ["employee_id"], name: "index_employee_teams_on_employee_id"
    t.index ["team_id", "employee_id"], name: "index_employee_teams_on_team_id_and_employee_id"
    t.index ["team_id"], name: "index_employee_teams_on_team_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "user"
    t.string "designation"
    t.boolean "wants_to_go_lunch"
    t.string "name"
    t.string "department"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department"], name: "index_employees_on_department"
    t.index ["designation"], name: "index_employees_on_designation"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["name"], name: "index_employees_on_name"
    t.index ["role"], name: "index_employees_on_role"
    t.index ["wants_to_go_lunch"], name: "index_employees_on_wants_to_go_lunch"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blind_dates", "teams"
  add_foreign_key "employee_teams", "employees"
  add_foreign_key "employee_teams", "teams"
end
