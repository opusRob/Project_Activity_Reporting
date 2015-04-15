json.array!(@employers) do |employer|
  json.extract! employer, :id, :name, :is_active, :is_deleted, :deleted_at
  json.url employer_url(employer, format: :json)
end
