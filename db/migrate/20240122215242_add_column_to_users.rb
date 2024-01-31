class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :contact_details, :jsonb
  end
end
