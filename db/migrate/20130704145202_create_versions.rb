class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.string :number
      t.text :changelog
      t.references :application
      t.attachment :deployable
      t.timestamps
    end
  end
end
