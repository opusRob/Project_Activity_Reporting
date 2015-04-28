json.array!(@tasks) do |task|
  json.extract! task, :id, :task_or_story_identifier, :name, :description, :task_type_id, :created_by, :updated_by, :is_active, :is_deleted, :deleted_at
  json.url task_url(task, format: :json)
end
