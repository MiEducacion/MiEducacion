class CreateCoursesUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :courses_users
    create_table :courses_users, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
    end
  end
end
