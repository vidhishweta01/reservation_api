class Booking < ApplicationRecord
  validates_presence_of :booking_time
  belongs_to :spa_n_salon
  belongs_to :user
  belongs_to :service
  belongs_to :owner, foreign_key: true
end
