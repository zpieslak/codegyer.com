FactoryGirl.define do
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
end
