class Vote < ApplicationRecord
  belongs_to :poll_option
  belongs_to :user

  validates :rating, presence: true, inclusion: -5..5

  before_validation(on: :create) do
    if Vote.find_by(user_id: self.user_id, poll_option_id: self.poll_option_id)
      return flash[:alert] = "Cant vote more than once."
    end
  end
end
