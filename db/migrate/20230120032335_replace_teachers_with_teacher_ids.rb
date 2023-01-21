class ReplaceTeachersWithTeacherIds < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :teachers
    add_column :courses, :teacher_ids, :integer, array: true
  end
end
