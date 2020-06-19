
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
