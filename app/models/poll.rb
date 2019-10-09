class Poll < ApplicationRecord
  resourcify

  has_many :poll_options
  has_many :groups, through: :poll_groups
end
