class CreatePollOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :poll_options do |t|
      t.text    :description
      t.integer :poll_id
      t.string  :title
      t.integer :user_id
    end
  end
end
