class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poll_options
  has_many :votes

  has_many :groups
  has_many :groups, :through => :users_groups

end
