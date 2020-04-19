class User < ApplicationRecord
  has_many :guests
  has_many :notifications
  has_many :reports
  has_many :reports
  has_many :memberships
  has_many :mail_boxes
  has_one :multimedium
end
