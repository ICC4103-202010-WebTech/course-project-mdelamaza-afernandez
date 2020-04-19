class DateOption < ApplicationRecord
  belongs_to :event
  has_many :votes
end
