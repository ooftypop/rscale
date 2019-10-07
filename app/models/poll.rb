class Poll < ApplicationRecord
  resourcify

  has_many :poll_options
  # has_many :users, through: :roles
end
