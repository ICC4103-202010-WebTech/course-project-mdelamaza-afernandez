class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :reports
  has_many :users, through: :reports
end
