class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_or_story_identifier
      t.string :name
      t.text :description
      t.references :task_type, index: true
      t.references :created_by_user, index: true
      t.references :updated_by_user, index: true
      t.boolean :is_active
      t.boolean :is_deleted
      t.date :deleted_at

      t.timestamps
      
      t.foreign_key :task_types
      t.foreign_key :users, column: :created_by_user_id
      t.foreign_key :users, column: :updated_by_user_id
    end
  end
end
