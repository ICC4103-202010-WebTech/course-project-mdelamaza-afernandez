class Event < ApplicationRecord
  has_many :date_options
  has_many :guests
  has_many :notifications
  has_many :multimedia
  has_many :reports
  belongs_to :organization
end
