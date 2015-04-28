class CreateProjectOrganizations < ActiveRecord::Migration
  def change
    create_table :project_organizations do |t|
      t.references :project, polymorphic: true, index: {name: "index_project_organizations_on_project_id_and_project"}
      t.references :organization, polymorphic: true, index: {name: "index_project_organizations_on_org_id_and_org"}
      t.references :project_organization_type, polymorphic: true, index: {name: "index_project_organizations_on_org_type_id_and_org_type"}

      t.timestamps
      
      t.foreign_key :projects
      t.foreign_key :organizations
      t.foreign_key :project_organization_types
    end
  end
end