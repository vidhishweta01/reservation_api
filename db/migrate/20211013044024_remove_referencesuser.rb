class RemoveReferencesuser < ActiveRecord::Migration[6.1]
  def change
    remove_column :spa_n_salons, :user_id
  end
end
