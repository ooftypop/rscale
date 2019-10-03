class CreatePollsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :forum_id
      t.string  :title
      t.text    :description
    end
  end
end
