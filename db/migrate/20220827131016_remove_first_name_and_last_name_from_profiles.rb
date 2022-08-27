# frozen_string_literal: true

class RemoveFirstNameAndLastNameFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :first_name
    remove_column :profiles, :last_name

    add_column :profiles, :display_name, :string
  end
end
