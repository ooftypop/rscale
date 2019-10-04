class Forum < ApplicationRecord
  resourcify
  has_many :polls
end
