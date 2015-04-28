class CreateProjectTeamEmployees < ActiveRecord::Migration
  def change
    create_table :project_team_employees do |t|
      t.references :employee, polymorphic: true, index: true
      t.references :project, polymorphic: true, index: true
      t.references :project_team_role, polymorphic: true, index: {name: "index_project_team_employees_on_prj_tm_rol_id_n_prj_tm_rol_typ"}

      t.timestamps
      
      t.foreign_key :employees
      t.foreign_key :projects
      t.foreign_key :project_team_roles
    end
  end
end
