# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, null: false, unique: true
      t.text :biography
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
