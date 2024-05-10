class ChangeContactDetailsDefaultToEmptyHash < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :contact_details, {}
  end
end
