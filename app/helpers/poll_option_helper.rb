module PollOptionHelper
  def average_poll_option_vote(poll_option, precision)
    vote_average = []
    poll_option.votes.each do |vote|
      vote_average = vote_average.push(vote.rating.to_f)
    end
    vote_average.sum
  end
end
