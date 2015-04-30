class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references :project, polymorphic: true, index: true
      t.string :name
      t.boolean :is_active
      t.boolean :is_deleted
      t.date :deleted_at

      t.timestamps
      
      t.foreign_key :projects
    end
  end
end
