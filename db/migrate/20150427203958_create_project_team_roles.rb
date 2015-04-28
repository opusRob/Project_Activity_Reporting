class CreateProjectTeamRoles < ActiveRecord::Migration
  def change
    create_table :project_team_roles do |t|
      t.string :name
      t.text :description
      t.references :project_team, polymorphic: true, index: {name: "index_project_team_roles_on_proj_team_id_and_proj_team_type"}
      t.boolean :is_active
      t.boolean :is_deleted
      t.date :deleted_at

      t.timestamps
      
      t.foreign_key :project_teams
    end
  end
end