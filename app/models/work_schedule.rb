# frozen_string_literal: true

class WorkSchedule < ApplicationRecord
  validates_presence_of :day, :start_time, :end_time
  validates_inclusion_of :day, in: %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  validates_inclusion_of :duration, in: [15, 30, 45], message: 'service duration can be either 15, 30 and 45 min'
  belongs_to :spa_n_salon
  belongs_to :owner
end
