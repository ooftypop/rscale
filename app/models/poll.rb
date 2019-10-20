class Poll < ApplicationRecord
  resourcify

  has_many :poll_options, dependent: :destroy
  has_many :polls_groups

  has_many :groups, through: :polls_groups

  validates :title, presence: true

  # accepts_nested_attributes_for :poll_options, reject_if: lambda {|attributes| attributes['title'].blank?}
end
