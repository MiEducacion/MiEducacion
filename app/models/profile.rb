class Profile < ApplicationRecord
belongs_to :user

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  validates :biography, length: { maximum: 300 }
end
