class RemoveColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :building_access
  end
end
