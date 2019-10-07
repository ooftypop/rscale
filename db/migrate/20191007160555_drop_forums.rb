class DropForums < ActiveRecord::Migration[5.2]
  def change
    drop_table :forums
  end
end
