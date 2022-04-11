class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.text :name
      t.string :cover
      t.string :teacher_id

      t.timestamps
    end
  end
end
