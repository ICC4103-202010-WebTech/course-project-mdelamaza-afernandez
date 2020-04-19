class DateOption < ApplicationRecord
  belongs_to :event
  has_many :votes
  has_many :users, through: :votes
end
