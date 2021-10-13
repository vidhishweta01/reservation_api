# frozen_string_literal: true

class RemoveReferences < ActiveRecord::Migration[6.1]
  def change
    remove_column :spa_n_salons, :user, :references
  end
end
