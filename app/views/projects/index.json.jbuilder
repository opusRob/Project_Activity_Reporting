json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :is_active, :is_deleted, :deleted_at
  json.url project_url(project, format: :json)
end
