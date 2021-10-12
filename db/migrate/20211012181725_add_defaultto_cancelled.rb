class AddDefaulttoCancelled < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :cancelled, :boolean, default: false
  end
end
