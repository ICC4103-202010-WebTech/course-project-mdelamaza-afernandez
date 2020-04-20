class Vote < ApplicationRecord
  belongs_to :date_options
  belongs_to :users
  after_destroy :log_destroy_action
  def log_destroy_action
    puts 'Vote destroyed'
  end
end
