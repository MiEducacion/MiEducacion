# frozen_string_literal: true

class Course < ApplicationRecord
  has_and_belongs_to_many :teachers, class_name: 'User', join_table: :courses_users, foreign_key: :course_id, association_foreign_key: :user_id
  
  validates :name, presence: true
end
