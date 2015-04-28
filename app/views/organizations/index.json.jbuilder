json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :is_active, :is_deleted, :deleted_at
  json.url organization_url(organization, format: :json)
end
