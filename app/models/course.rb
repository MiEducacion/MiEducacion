# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, :teachers, presence: true
end
