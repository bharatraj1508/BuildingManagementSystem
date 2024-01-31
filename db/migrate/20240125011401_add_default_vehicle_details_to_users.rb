class AddDefaultVehicleDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :vehicle_details, {}
  end
end
