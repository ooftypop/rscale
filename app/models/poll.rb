class Poll < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  resourcify

  has_many :poll_options, dependent: :destroy
  has_many :polls_groups
  has_many :groups, through: :polls_groups

  validates :title, presence: true

  accepts_nested_attributes_for :poll_options, reject_if: lambda {|attributes| attributes['title'].blank?}, allow_destroy: true

  def timed?

  end

  def all_users_voted?
    user_votes         = 0
    total_user_votes   = 0
    roles_count        = 0
    total_poll_options = self.poll_options.count

    self.roles.each do |role|
      roles_count = roles_count + role.users.count
    end

    self.poll_options.each do |poll_option|
      user_votes = user_votes + poll_option.votes.count
    end

    total_avaliable_votes = roles_count * total_poll_options

    if total_avaliable_votes == user_votes
      self.update(active: false)
    end
  end

  def inactive?
    self.active == false
  end
end
