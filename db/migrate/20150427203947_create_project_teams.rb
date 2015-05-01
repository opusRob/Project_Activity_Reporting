class CreateProjectTeams < ActiveRecord::Migration
  def change
    create_table :project_teams do |t|
      t.string :name
      t.references :project, polymorphic: true, index: true
      t.boolean :is_active
      t.boolean :is_deleted
      t.datetime :deleted_at

      t.timestamps
      
      t.foreign_key :projects
    end
  end
end
