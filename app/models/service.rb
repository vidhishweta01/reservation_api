class Service < ApplicationRecord
  belongs_to :spa_n_salon
  validates_presence_of :name, :cost, :duration
  validates :name, length: { minimum: 4 }
  has_many :bookings
  has_many :users, through: :bookings
end
