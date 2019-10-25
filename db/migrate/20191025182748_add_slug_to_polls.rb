class AddSlugToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :slug, :string
    add_index :polls, :slug, unique: true
  end
end
