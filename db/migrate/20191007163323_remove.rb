class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :polls, :forum_id
  end
end
