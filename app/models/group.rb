class Group < ApplicationRecord
  belongs_to :user

  has_many :users, through: :user_groups
  has_many :polls, through: :poll_groups
end
