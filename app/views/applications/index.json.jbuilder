json.array!(@applications) do |application|
  json.extract! application, :id, :name, :short_name, :description, :is_active, :is_deleted, :deleted_at
  json.url application_url(application, format: :json)
end
