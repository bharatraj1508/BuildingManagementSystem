class DropBuildingsUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :buildings_users
  end
end
