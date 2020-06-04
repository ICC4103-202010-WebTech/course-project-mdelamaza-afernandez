class DateOption < ApplicationRecord
  belongs_to :event


  after_destroy :log_destroy_action
  acts_as_votable
  def log_destroy_action
    puts 'dateOption destroyed'
  end
end
