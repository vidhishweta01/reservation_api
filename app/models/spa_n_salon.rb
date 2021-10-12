class SpaNSalon < ApplicationRecord
  validates_presence_of :companyName, :GSTIN, :PAN, :address, :available_chairs
  validates :GSTIN, length: { minimum: 15, maximum: 15 }
  validates :PAN, length: {minimum: 10, maximum: 10}
  belongs_to :user
  has_many :bookings
  has_many :users, :through => :bookings
  has_many :services
  has_many :work_schedules
end
