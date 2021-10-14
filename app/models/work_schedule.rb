class WorkSchedule < ApplicationRecord
  validates_presence_of :day, :start_time, :end_time
  validates_inclusion_of :day, in: %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  belongs_to :spa_n_salon
end
