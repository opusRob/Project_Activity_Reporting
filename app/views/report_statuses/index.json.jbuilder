json.array!(@report_statuses) do |report_status|
  json.extract! report_status, :id, :name, :description, :is_editable, :is_active, :is_deleted, :deleted_at
  json.url report_status_url(report_status, format: :json)
end
