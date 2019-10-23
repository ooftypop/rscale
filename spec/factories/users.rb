FactoryBot.define do
  factory :user1, class: User do
    sequence(:email) { |n| "test#{n}@example.com"}
    password {"password"}
  end
end
