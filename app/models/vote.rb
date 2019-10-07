class Vote < ApplicationRecord
  belongs_to :poll_option
  belongs_to :user
end
