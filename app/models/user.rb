class User < ApplicationRecord
  rolify
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after_create :assign_default_role
  #
  # def assign_default_role
  #   self.add_role(:newuser) if self.roles.blank?
  # end

end
