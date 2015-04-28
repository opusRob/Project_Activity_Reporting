class CreateProjectTeamEmployeeReports < ActiveRecord::Migration
  def change
    create_table :project_team_employee_reports do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :report_status, index: true
      t.references :employee, polymorphic: true, index: {name: "index_project_team_employee_reports_on_emp_id_and_emp_type"}
      t.references :project, polymorphic: true, index: {name: "index_project_team_employee_reports_on_proj_id_and_proj_type"}
      t.references :project_team, polymorphic: true, index: {name: "index_project_team_employee_reports_on_proj_tm_id_n_proj_tm_tp"}
      t.references :project_team_role, polymorphic: true, index: {name: "index_project_team_employee_reports__pj_tm_rl_id_n_pj_tm_rl_tp"}

      t.timestamps
      
      t.foreign_key :report_statuses
      t.foreign_key :employees
      t.foreign_key :projects
      t.foreign_key :project_teams
      t.foreign_key :project_team_roles
    end
  end
end
