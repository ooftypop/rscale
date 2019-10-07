class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :poll_option_id
      t.integer :user_id
      t.decimal :rating, default: 0.0

      t.timestamps
    end
  end
end
