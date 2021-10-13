# frozen_string_literal: true

class Booking < ApplicationRecord
  validates_presence_of :booking_time
  belongs_to :spa_n_salon
  belongs_to :user
  belongs_to :service
  belongs_to :owner, foreign_key: true
  scope :today, -> { where('booking_time == ?', Date.today) }
  scope :future, -> { where('booking_time > ?', Date.today).order(:booking_time) }
  # scope :day, -> {where(DayName(Date('booking_time')))}
  # scope :time, -> {}

  def available_slots(service_id)
    array = Booked_Slot()
    spa = Service.where(id: service_id).pluck(:spa_n_salon_id)
    work_start_time = WorkSchedule(where(spa_n_salon_id: spa, day: DayName(Date(booking_time))).pluck(:start_time))
    work_end_time = WorkSchedule(where(spa_n_salon_id: spa, day: DayName(Date(booking_time))).pluck(:end_time))
  end
end
