class CreateSalon < ActiveRecord::Migration[6.1]
  def change
    create_table :spa_n_salons do |t|
      t.string :companyName
      t.string :address
      t.integer :available_chairs
      t.references :owner, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
