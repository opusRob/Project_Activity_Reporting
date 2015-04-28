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

ActiveRecord::Schema.define(version: 20150427204134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "builds", force: true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "organization_id"
    t.string   "organization_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["organization_id", "organization_type"], name: "index_employees_on_organization_id_and_organization_type", using: :btree

  create_table "employers", force: true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_organization_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_organizations", force: true do |t|
    t.integer  "project_id"
    t.string   "project_type"
    t.integer  "organization_id"
    t.string   "organization_type"
    t.integer  "project_organization_type_id"
    t.string   "project_organization_type_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_organizations", ["organization_id", "organization_type"], name: "index_project_organizations_on_org_id_and_org", using: :btree
  add_index "project_organizations", ["project_id", "project_type"], name: "index_project_organizations_on_project_id_and_project", using: :btree
  add_index "project_organizations", ["project_organization_type_id", "project_organization_type_type"], name: "index_project_organizations_on_org_type_id_and_org_type", using: :btree

  create_table "project_team_employee_report_tasks", force: true do |t|
    t.integer  "project_team_employee_report_id"
    t.date     "work_date"
    t.decimal  "work_hours",                      precision: 3, scale: 1
    t.integer  "task_id"
    t.integer  "application_id"
    t.integer  "release_id"
    t.integer  "build_id"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_team_employee_report_tasks", ["application_id"], name: "index_project_team_employee_report_tasks_on_application_id", using: :btree
  add_index "project_team_employee_report_tasks", ["build_id"], name: "index_project_team_employee_report_tasks_on_build_id", using: :btree
  add_index "project_team_employee_report_tasks", ["created_by_user_id"], name: "index_project_team_employee_report_tasks_on_created_by_user_id", using: :btree
  add_index "project_team_employee_report_tasks", ["project_team_employee_report_id"], name: "index_project_team_employee_report_tasks__proj_tm_emp_rpt_id", using: :btree
  add_index "project_team_employee_report_tasks", ["release_id"], name: "index_project_team_employee_report_tasks_on_release_id", using: :btree
  add_index "project_team_employee_report_tasks", ["task_id"], name: "index_project_team_employee_report_tasks_on_task_id", using: :btree
  add_index "project_team_employee_report_tasks", ["updated_by_user_id"], name: "index_project_team_employee_report_tasks_on_updated_by_user_id", using: :btree

  create_table "project_team_employee_reports", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "report_status_id"
    t.integer  "employee_id"
    t.string   "employee_type"
    t.integer  "project_id"
    t.string   "project_type"
    t.integer  "project_team_id"
    t.string   "project_team_type"
    t.integer  "project_team_role_id"
    t.string   "project_team_role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_team_employee_reports", ["employee_id", "employee_type"], name: "index_project_team_employee_reports_on_emp_id_and_emp_type", using: :btree
  add_index "project_team_employee_reports", ["project_id", "project_type"], name: "index_project_team_employee_reports_on_proj_id_and_proj_type", using: :btree
  add_index "project_team_employee_reports", ["project_team_id", "project_team_type"], name: "index_project_team_employee_reports_on_proj_tm_id_n_proj_tm_tp", using: :btree
  add_index "project_team_employee_reports", ["project_team_role_id", "project_team_role_type"], name: "index_project_team_employee_reports__pj_tm_rl_id_n_pj_tm_rl_tp", using: :btree
  add_index "project_team_employee_reports", ["report_status_id"], name: "index_project_team_employee_reports_on_report_status_id", using: :btree

  create_table "project_team_employees", force: true do |t|
    t.integer  "employee_id"
    t.string   "employee_type"
    t.integer  "project_id"
    t.string   "project_type"
    t.integer  "project_team_role_id"
    t.string   "project_team_role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_team_employees", ["employee_id", "employee_type"], name: "index_project_team_employees_on_employee_id_and_employee_type", using: :btree
  add_index "project_team_employees", ["project_id", "project_type"], name: "index_project_team_employees_on_project_id_and_project_type", using: :btree
  add_index "project_team_employees", ["project_team_role_id", "project_team_role_type"], name: "index_project_team_employees_on_prj_tm_rol_id_n_prj_tm_rol_typ", using: :btree

  create_table "project_team_roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_team_id"
    t.string   "project_team_type"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_team_roles", ["project_team_id", "project_team_type"], name: "index_project_team_roles_on_proj_team_id_and_proj_team_type", using: :btree

  create_table "project_teams", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "project_type"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_teams", ["project_id", "project_type"], name: "index_project_teams_on_project_id_and_project_type", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_statuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_editable"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_editable"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "task_or_story_identifier"
    t.string   "name"
    t.text     "description"
    t.integer  "task_type_id"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["created_by_user_id"], name: "index_tasks_on_created_by_user_id", using: :btree
  add_index "tasks", ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree
  add_index "tasks", ["updated_by_user_id"], name: "index_tasks_on_updated_by_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.date     "password_last_updated_at"
    t.integer  "employee_id"
    t.string   "employee_type"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.date     "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["employee_id", "employee_type"], name: "index_users_on_employee_id_and_employee_type", using: :btree

  add_foreign_key "employees", "organizations", name: "employees_organization_id_fk"

  add_foreign_key "project_organizations", "organizations", name: "project_organizations_organization_id_fk"
  add_foreign_key "project_organizations", "project_organization_types", name: "project_organizations_project_organization_type_id_fk"
  add_foreign_key "project_organizations", "projects", name: "project_organizations_project_id_fk"

  add_foreign_key "project_team_employee_report_tasks", "applications", name: "project_team_employee_report_tasks_application_id_fk"
  add_foreign_key "project_team_employee_report_tasks", "builds", name: "project_team_employee_report_tasks_build_id_fk"
  add_foreign_key "project_team_employee_report_tasks", "releases", name: "project_team_employee_report_tasks_release_id_fk"
  add_foreign_key "project_team_employee_report_tasks", "tasks", name: "project_team_employee_report_tasks_task_id_fk"
  add_foreign_key "project_team_employee_report_tasks", "users", name: "project_team_employee_report_tasks_created_by_user_id_fk", column: "created_by_user_id"
  add_foreign_key "project_team_employee_report_tasks", "users", name: "project_team_employee_report_tasks_updated_by_user_id_fk", column: "updated_by_user_id"

  add_foreign_key "project_team_employee_reports", "employees", name: "project_team_employee_reports_employee_id_fk"
  add_foreign_key "project_team_employee_reports", "project_team_roles", name: "project_team_employee_reports_project_team_role_id_fk"
  add_foreign_key "project_team_employee_reports", "project_teams", name: "project_team_employee_reports_project_team_id_fk"
  add_foreign_key "project_team_employee_reports", "projects", name: "project_team_employee_reports_project_id_fk"
  add_foreign_key "project_team_employee_reports", "report_statuses", name: "project_team_employee_reports_report_status_id_fk"

  add_foreign_key "project_team_employees", "employees", name: "project_team_employees_employee_id_fk"
  add_foreign_key "project_team_employees", "project_team_roles", name: "project_team_employees_project_team_role_id_fk"
  add_foreign_key "project_team_employees", "projects", name: "project_team_employees_project_id_fk"

  add_foreign_key "project_team_roles", "project_teams", name: "project_team_roles_project_team_id_fk"

  add_foreign_key "project_teams", "projects", name: "project_teams_project_id_fk"

  add_foreign_key "tasks", "task_types", name: "tasks_task_type_id_fk"
  add_foreign_key "tasks", "users", name: "tasks_created_by_user_id_fk", column: "created_by_user_id"
  add_foreign_key "tasks", "users", name: "tasks_updated_by_user_id_fk", column: "updated_by_user_id"

  add_foreign_key "users", "employees", name: "users_employee_id_fk"

end
