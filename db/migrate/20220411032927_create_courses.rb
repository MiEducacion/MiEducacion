# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.text :name
      t.string :cover
      t.text :teachers, array: true
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
