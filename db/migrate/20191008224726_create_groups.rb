class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.text   :description
      t.timestamps
    end

    create_table :poll_groups do |t|
      t.belongs_to :poll
      t.belongs_to :group
      t.timestamps
    end

    create_table :user_groups do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
