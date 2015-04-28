json.array!(@builds) do |build|
  json.extract! build, :id, :name, :is_active, :is_deleted, :deleted_at
  json.url build_url(build, format: :json)
end
