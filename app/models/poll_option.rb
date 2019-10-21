class PollOption < ApplicationRecord
  belongs_to :poll, optional: true
  belongs_to :user

  has_many :votes, dependent: :destroy

  validates :title,   presence: true

  def sum_ratings
    vote_average = []
    self.votes.each do |vote|
      vote_average = vote_average.push(vote.rating.to_f)
    end
    vote_average.sum
  end

end
