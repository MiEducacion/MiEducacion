# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic
  rolify
  after_create :assign_default_role
  after_create :set_new_user
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

  def set_new_user
    self.new_user = true
  end

  def student?
    has_role?(:student)
  end

  def admin?
    has_role?(:admin)
  end

  def teacher?
    has_role?(:teacher)
  end

  def principal?
    has_role?(:principal)
  end

  def moderator?
    has_role?(:moderator)
  end

  def trusted?
    has_role?(:trusted)
  end

  def can_create_course?
    admin? || teacher?
  end

  has_one :profile
  has_one :role

  accepts_nested_attributes_for :profile
end
