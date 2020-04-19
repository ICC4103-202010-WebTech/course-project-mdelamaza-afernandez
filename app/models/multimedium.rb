class Multimedium < ApplicationRecord
  belongs_to :events
  belongs_to :organizations
  belongs_to :users
end
