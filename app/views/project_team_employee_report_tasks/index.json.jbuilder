json.array!(@project_team_employee_report_tasks) do |project_team_employee_report_task|
  json.extract! project_team_employee_report_task, :id, :project_team_employee_report_id, :work_date, :work_hours, :task_id, :application_id, :release_id, :build_id, :created_by, :updated_by
  json.url project_team_employee_report_task_url(project_team_employee_report_task, format: :json)
end
