json.array!(@project_organization_types) do |project_organization_type|
  json.extract! project_organization_type, :id, :name, :description, :is_active, :is_deleted, :deleted_at
  json.url project_organization_type_url(project_organization_type, format: :json)
end
