class Vote < ApplicationRecord
  belongs_to :poll_option
  belongs_to :user

  validates :rating, presence: true, inclusion: -5..5
end
