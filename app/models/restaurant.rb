class Restaurant < ApplicationRecord
  has_many :courses
  has_many :reservations
end
