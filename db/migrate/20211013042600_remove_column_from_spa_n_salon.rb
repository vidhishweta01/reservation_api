class RemoveColumnFromSpaNSalon < ActiveRecord::Migration[6.1]
  def change
    remove_column :spa_n_salons, :GSTIN, :string
    remove_column :spa_n_salons, :PAN, :string
  end
end
