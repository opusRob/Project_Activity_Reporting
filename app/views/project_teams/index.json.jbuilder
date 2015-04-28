json.array!(@project_teams) do |project_team|
  json.extract! project_team, :id, :name, :project, :is_active, :is_deleted, :deleted_at
  json.url project_team_url(project_team, format: :json)
end
