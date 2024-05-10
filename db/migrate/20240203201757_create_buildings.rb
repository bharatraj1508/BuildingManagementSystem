class CreateBuildings < ActiveRecord::Migration[7.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :building_manager
      t.string :building_supervisor

      t.timestamps
    end
  end
end
