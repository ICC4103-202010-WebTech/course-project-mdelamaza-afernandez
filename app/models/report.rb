class Report < ApplicationRecord
  belongs_to :user
  has_one :event
  has_one :comment
  has_one :organization

end
