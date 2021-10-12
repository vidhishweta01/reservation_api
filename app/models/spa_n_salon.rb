class SpaNSalon < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, :through => :bookings
  has_many :services
  has_many :work_schedules
end
