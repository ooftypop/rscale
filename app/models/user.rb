class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :poll_options
  has_many :votes

end
