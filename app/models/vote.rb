class Vote < ApplicationRecord
  belongs_to :date_options
  belongs_to :users
end
