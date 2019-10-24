class PollOption < ApplicationRecord
  has_many_attached :images

  belongs_to :poll, optional: true
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :title,   presence: true

  def average_ratings
    vote_average = []

    self.votes.each do |vote|
      vote_average = vote_average.push(vote.rating.to_f)
    end

    vote_count    = vote_average.count
    vote_sum      = vote_average.sum
    sumed_average = (vote_sum/ vote_count) unless vote_count == 0

    sumed_average.round(2) unless vote_count == 0
  end
end
