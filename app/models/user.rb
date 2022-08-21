# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  after_initialize :assign_default_role, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :roles, presence: true

  attr_accessor :new_user

  # All users have the student role by default
  def assign_default_role
    add_role(:student)
  end

  def is_admin?
    self.has_role?(:admin)
  end
  

  has_one :profile
  has_one :role

  accepts_nested_attributes_for :profile
end
