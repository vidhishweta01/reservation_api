# frozen_string_literal: true

class Addreference < ActiveRecord::Migration[6.1]
  def change
    add_column :spa_n_salons, :owner_id, :integer
    add_index :spa_n_salons, :owner_id
  end
end
