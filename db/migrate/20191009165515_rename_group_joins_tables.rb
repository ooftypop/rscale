class RenameGroupJoinsTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :poll_groups, :polls_groups

    rename_table :user_groups, :users_groups
  end
end
