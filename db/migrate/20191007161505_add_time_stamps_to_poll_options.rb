class AddTimeStampsToPollOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :poll_options, :created_at, :datetime
    add_column :poll_options, :updated_at, :datetime
  end
end
