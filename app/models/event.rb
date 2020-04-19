class Event < ApplicationRecord
  has_many :date_options
  has_many :guests
  has_many :users, through: :guests
  has_many :notifications
  has_many :users, through: :notifications
  has_many :comments
  has_many :users, through: :comments
  has_many :reports
  has_many :users, through: :reports
  has_many :date_options
  has_many :multimedia

  belongs_to :organization
end
