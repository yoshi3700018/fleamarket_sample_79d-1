class RenameUsersColumnToPostals < ActiveRecord::Migration[6.0]
  def change
    rename_column :postals, :users_id, :user_id
  end
end
