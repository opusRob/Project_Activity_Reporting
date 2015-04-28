json.array!(@project_team_employee_reports) do |project_team_employee_report|
  json.extract! project_team_employee_report, :id, :name, :start_date, :end_date, :report_status_id, :employee_id, :employee_type, :project_id, :project_type, :project_team_id, :project_team_type, :project_team_role_id, :project_team_role_type
  json.url project_team_employee_report_url(project_team_employee_report, format: :json)
end
