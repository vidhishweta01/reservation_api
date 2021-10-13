# frozen_string_literal: true

class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :GSTIN
      t.string :PAN
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
