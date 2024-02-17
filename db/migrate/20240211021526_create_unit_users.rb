class CreateUnitUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
