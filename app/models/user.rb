class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poll_options
  has_many :votes
  has_many :users_groups

  has_many :groups, through: :users_groups
  has_many :email_groups, class_name: "Group", foreign_key: "user_id"

  def voted_for_option?(poll_option)
    poll_option.votes.find_by(user_id: self.id).nil?
  end

  def voted_for_poll?(poll)
    poll_options = poll.poll_options
    user_votes   = []

    poll_options.ids.each do |option_id|
      vote = Vote.find_by(user_id: self.id, poll_option_id: option_id)

      if vote
        user_votes << vote
      end
    end
    if user_votes.count == poll_options.count
      return true
    end
  end
end
