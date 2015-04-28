json.array!(@project_team_roles) do |project_team_role|
  json.extract! project_team_role, :id, :name, :description, :project_team, :is_active, :is_deleted, :deleted_at
  json.url project_team_role_url(project_team_role, format: :json)
end
