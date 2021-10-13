class Owner < ApplicationRecord
  belongs_to :user
  validates_presence_of :GSTIN, :PAN
  validates :GSTIN, uniqueness: true, length: { minimum: 15, maximum: 15 }
  validates :PAN, uniqueness: true, length: {minimum: 10, maximum: 10}
  has_many :bookings
  has_many :users, :through => :bookings
  has_many :spa_n_salons
  has_many :services, :through => :spa_n_salons
  has_many :work_schedules, :through => :spa_n_salons
end
