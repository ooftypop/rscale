class Poll < ApplicationRecord
  resourcify

  has_many :poll_options
  has_many :polls_groups

  has_many :groups, through: :polls_groups
end
