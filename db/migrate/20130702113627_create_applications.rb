class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.text :description
      t.string :context_root
      t.timestamps
    end
  end
end
