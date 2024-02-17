class AddBuildingAccessToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :building_access, :integer, array: true, default: []
  end
end
