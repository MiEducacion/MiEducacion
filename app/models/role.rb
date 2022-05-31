# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = %w[
    admin
    super_admin
    principal
    teacher
    student
  ].freeze

  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates :name,
            inclusion: { in: ROLES }

  scopify
end
