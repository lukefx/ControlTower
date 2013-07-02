class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :dns
      t.string :ip
      t.text   :description
      t.string :username
      t.string :password
      t.text   :configuration
      t.timestamps
    end
  end
end
