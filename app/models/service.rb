class Service < ApplicationRecord
  belongs_to :spa_n_salon
  has_many :bookings
  has_many :users, :through => :bookings
end
