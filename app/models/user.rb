class User < ApplicationRecord
  has_many :guests
  has_many :events, through: :guests
  has_many :notifications
  has_many :events, through: :notifications
  has_many :reports
  has_many :events, through: :reports
  has_many :comments, through: :reports
  has_many :organizations, through: :reports
  has_many :comments
  has_many :events, through: :comments
  has_many :memberships
  has_many :organizations, through: :memberships
  has_many :mail_boxes
  has_one :multimedium
  has_many :votes
  has_many :date_options, through: :votes
end
