class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :reports, dependent: :destroy
  has_many :users, through: :reports
end