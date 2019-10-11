class PollOption < ApplicationRecord
  belongs_to :poll
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
