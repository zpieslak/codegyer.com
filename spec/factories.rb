require 'faker'

FactoryGirl.define do
  factory :project do
    name Faker::Name.name
    description Faker::Lorem.sentence(10)
    short_content Faker::Lorem.sentence(10)
    content Faker::Lorem.sentence(10)
    features Faker::Lorem.sentence(10)
  end

  factory :message do
    name Faker::Name.name
    email Faker::Internet.email
    content Faker::Lorem.sentence(10)

    trait :invalid do
      name ""
      email ""
      content ""
    end
  end

  factory :subscription do
    email Faker::Internet.email

    trait :invalid do
      email ""
    end
  end

  factory :post do
    title Faker::Lorem.sentence(2)
    content Faker::Lorem.sentence(10)
  end
end
