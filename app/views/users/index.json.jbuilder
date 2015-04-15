json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :first_name, :last_name, :password_last_updated_at, :employer_id, :role_id, :is_active, :is_deleted, :deleted_at
  json.url user_url(user, format: :json)
end
