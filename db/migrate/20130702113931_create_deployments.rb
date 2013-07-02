class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.references :server
      t.references :application
      t.timestamps
    end
  end
end
