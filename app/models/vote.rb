class Vote < ApplicationRecord
  belongs_to :poll_option
  belongs_to :user
  # belongs_to :poll, through: :poll_option
  # belongs_to :forum, through: :poll
end
