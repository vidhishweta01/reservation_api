# frozen_string_literal: true

class SpaNSalon < ApplicationRecord
  validates_presence_of :companyName, :address, :available_chairs
  belongs_to :owner
  has_many :bookings
  has_many :users, through: :bookings
  has_many :services
  has_many :work_schedules
end
