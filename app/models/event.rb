class Event < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests
  has_many :notifications, dependent: :destroy
  has_many :users, through: :notifications
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :reports, dependent: :destroy
  has_many :users, through: :reports
  has_many :date_options, dependent: :destroy
  has_many :multimedia, dependent: :destroy
  belongs_to :organization
  after_destroy :log_destroy_action
  def log_destroy_action
    puts 'Event destroyed'
  end
  has_one_attached :flyer
  has_one_attached :video
  has_one_attached :file
  # validates :name, :description,:location,:private, presence: true
  # # validates :voted_date, not_in_past: true
  # validates :organization_id, presence: true

end
