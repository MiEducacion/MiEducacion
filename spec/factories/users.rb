# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name "Test User"
    email "example@example.com"
    password "please"
    password_confirmation "please"
    confirmed_at Time.now

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :creator do
      after(:create) { |user| user.add_role(:creator) }
    end

    factory :super_admin do
      after(:create) { |user| user.add_role(:super_admin) }
    end
  end
end
