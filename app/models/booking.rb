class Booking < ApplicationRecord
  belongs_to :spa_n_salon
  belongs_to :user
  belongs_to :service
end
