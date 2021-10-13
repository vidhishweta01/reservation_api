# frozen_string_literal: true

class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :owner_id, :integer
    add_index :bookings, :owner_id
  end
end
