class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  after_initialize :assign_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :roles, presence: true

  def assign_default_role
   add_role(:student)
  end

  has_one :profile
  has_one :role

  accepts_nested_attributes_for :profile
end
