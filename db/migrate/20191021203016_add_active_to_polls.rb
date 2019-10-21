class AddActiveToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :active, :boolean, default: true
  end
end
