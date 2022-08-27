# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :display_name, presence: true
  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  validates :biography, length: { maximum: 300 }
end
