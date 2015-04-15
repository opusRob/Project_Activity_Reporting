class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.datetime :password_last_updated_at
      t.integer :employer_id
      t.integer :role_id
      t.boolean :is_active
      t.boolean :is_deleted
      t.datetime :deleted_at

      t.timestamps
      
      t.foreign_key :employers
      t.foreign_key :roles
    end
  end
end
