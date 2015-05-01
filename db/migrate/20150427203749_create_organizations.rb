class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.boolean :is_active
      t.boolean :is_deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
