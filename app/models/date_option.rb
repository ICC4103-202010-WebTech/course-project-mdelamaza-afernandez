class DateOption < ApplicationRecord
  belongs_to :event
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  after_destroy :log_destroy_action
  def log_destroy_action
    puts 'dateOption destroyed'
  end
end
