class CreateWorkSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :work_schedules do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :spa_n_salon, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
