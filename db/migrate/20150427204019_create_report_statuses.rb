class CreateReportStatuses < ActiveRecord::Migration
  def change
    create_table :report_statuses do |t|
      t.references :project, polymorphic: true, index: true
      t.string :name
      t.text :description
      t.boolean :is_editable
      t.boolean :is_active
      t.boolean :is_deleted
      t.datetime :deleted_at

      t.timestamps
      
      t.foreign_key :projects
    end
  end
end
