class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :spa_n_salon, :through => :bookings
  has_many :services, :through => :bookings
end
