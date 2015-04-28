json.array!(@system_roles) do |system_role|
  json.extract! system_role, :id, :name, :description, :is_editable, :is_active, :is_deleted, :deleted_at
  json.url system_role_url(system_role, format: :json)
end
