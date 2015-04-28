class CreateProjectTeamEmployeeReportTasks < ActiveRecord::Migration
  def change
    create_table :project_team_employee_report_tasks do |t|
      t.references :project_team_employee_report, index: {name: "index_project_team_employee_report_tasks__proj_tm_emp_rpt_id"}
      t.date :work_date
      t.decimal :work_hours, precision: 3, scale: 1
      t.references :task, index: true
      t.references :application, index: true
      t.references :release, index: true
      t.references :build, index: true
      t.references :created_by_user, index: true
      t.references :updated_by_user, index: true

      t.timestamps
      
      t.foreign_key :project_team_employee_reports, name: "project_team_employee_report_tasks_proj_team_emp_rpt_id"
      t.foreign_key :tasks
      t.foreign_key :applications
      t.foreign_key :releases
      t.foreign_key :builds
      t.foreign_key :users, column: :created_by_user_id
      t.foreign_key :users, column: :updated_by_user_id
    end
  end
end
