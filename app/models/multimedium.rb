class Multimedium < ApplicationRecord
  has_many :events
  has_many :organizations
  has_many :users
end
