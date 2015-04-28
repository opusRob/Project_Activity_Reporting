json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :middle_name, :last_name, :organization_id, :organization_type
  json.url employee_url(employee, format: :json)
end
