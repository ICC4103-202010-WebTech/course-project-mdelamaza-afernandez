class Notification < ApplicationRecord
  belongs_to :event
  belongs_to :users
end
