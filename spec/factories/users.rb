# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :user do
    email { generate :email }
    confirmed_at { Time.current }
    registered_at { Time.current }

    trait :creator do
      after(:build) do |user|
        user.add_role(:admin)
        user.add_role(:creator)
      end
    end

    trait :admin do
      after(:build) { |user| user.add_role(:admin) }
    end
  end
end
