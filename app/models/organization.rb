class Organization < ApplicationRecord
  has_many :events
  has_many :multimedia
  has_many :memberships
  has_many :users,through: :memberships
  has_many :reports
  has_many :users, through: :reports
end
