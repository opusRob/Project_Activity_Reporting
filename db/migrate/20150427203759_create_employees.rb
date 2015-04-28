class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.references :organization, polymorphic: true, index: true

      t.timestamps
      
      t.foreign_key :organizations
    end
  end
end
