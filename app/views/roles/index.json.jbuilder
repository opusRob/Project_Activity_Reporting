json.array!(@roles) do |role|
  json.extract! role, :id, :name, :description, :is_system_role, :is_active, :is_deleted, :deleted_at
  json.url role_url(role, format: :json)
end
