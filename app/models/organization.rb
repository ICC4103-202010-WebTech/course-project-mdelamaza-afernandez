class Organization < ApplicationRecord
  has_many :events, dependent: :destroy
  # has_many :multimediums, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users,through: :memberships
  # has_many :reports, dependent: :destroy
  has_many :users, through: :reports
  has_one_attached :flyer
end