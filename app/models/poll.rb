class Poll < ApplicationRecord
  belongs_to :forum
  has_many   :poll_options
end
