FactoryGirl.define do
  factory :subscription do
    email Faker::Internet.email

    trait :invalid do
      email ''
    end
  end
end
