json.array!(@project_organizations) do |project_organization|
  json.extract! project_organization, :id, :project_id, :project_type, :organization_id, :organization_type, :project_organization_
  json.url project_organization_url(project_organization, format: :json)
end
