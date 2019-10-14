class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poll_options
  has_many :votes
  has_many :users_groups


  has_many :groups, through: :users_groups
  has_many :email_groups, class_name: "Group", foreign_key: "user_id"


  def confirmation_required?
    false
  end
end
