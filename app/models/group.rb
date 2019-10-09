class Group < ApplicationRecord
  belongs_to :user

  has_many :users_groups
  has_many :polls_groups

  has_many :users, through: :users_groups
  has_many :polls, through: :polls_groups

  accepts_nested_attributes_for :users
end
