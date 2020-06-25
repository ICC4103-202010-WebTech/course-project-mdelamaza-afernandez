class Multimedium < ApplicationRecord
  belongs_to :event
  # belongs_to :organizations
  # belongs_to :users
  has_one_attached :flyer
  has_one_attached :video
  has_one_attached :file
end
