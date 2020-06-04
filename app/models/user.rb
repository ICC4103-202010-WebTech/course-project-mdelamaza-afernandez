class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
class User < ApplicationRecord
  validates :email, presence: true, email: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true

  has_many :guests
  has_many :events, through: :guests

  has_many :notifications, dependent: :destroy
  has_many :events, through: :notifications

  has_many :reports, dependent: :destroy
  has_many :events, through: :reports
  has_many :comments, through: :reports
  has_many :organizations, through: :reports

  has_many :comments, dependent: :destroy
  has_many :events, through: :comments

  has_many :memberships
  has_many :organizations, through: :memberships

  has_many :mail_boxes

  has_one :multimedium



  has_one_attached :flyer
  acts_as_voter
  def self.search(search)
    where("lower(events.name) LIKE :search OR lower(organization.name) LIKE :search OR lower(user.user_name) LIKE :search", search: "%#{search.downcase}%").uniq
  end
  end
