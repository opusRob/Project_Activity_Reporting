json.array!(@releases) do |release|
  json.extract! release, :id, :name, :description, :is_active, :is_deleted, :deleted_at
  json.url release_url(release, format: :json)
end
