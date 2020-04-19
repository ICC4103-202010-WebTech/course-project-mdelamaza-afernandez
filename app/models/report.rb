class Report < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :comment
  belongs_to :organization

end
