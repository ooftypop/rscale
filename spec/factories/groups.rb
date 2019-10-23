FactoryBot.define do
  factory :group, class: Group do
    title {"Group title 1"}
    description {"Group description 1"}
    association :user, factory: :user_group
  end

  factory :user_group, class: User do
    sequence(:email) { |n| "testgroup#{n}@example.com"}
    password {'password'}
  end
end
