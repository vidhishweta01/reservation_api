class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.float :cost
      t.float :duration
      t.references :spa_n_salon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
