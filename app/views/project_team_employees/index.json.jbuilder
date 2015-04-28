json.array!(@project_team_employees) do |project_team_employee|
  json.extract! project_team_employee, :id, :employee, :project, :project_team_role
  json.url project_team_employee_url(project_team_employee, format: :json)
end
