class PollOption < ApplicationRecord
  belongs_to :poll
  belongs_to :user
  # has_many :votes
end
