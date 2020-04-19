class Organization < ApplicationRecord
  has_many :events
  has_many :multimedia
  has_many :memberships
end
