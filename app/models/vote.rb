class Vote < ApplicationRecord
  belongs_to :date_option
  belongs_to :user
  after_destroy :log_destroy_action
  def log_destroy_action
    puts 'Vote destroyed'
  end
end
