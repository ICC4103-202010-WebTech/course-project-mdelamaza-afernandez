class Vote < ApplicationRecord
  has_many :date_options
  has_many :users
end
