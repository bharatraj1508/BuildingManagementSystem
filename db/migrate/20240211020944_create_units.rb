class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.integer :unit_number
      t.string :parking_spot
      t.string :locker_number
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
