class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.boolean :is_active
      t.boolean :is_deleted
      t.date :deleted_at

      t.timestamps
    end
  end
end
