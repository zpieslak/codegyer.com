FactoryGirl.define do
  factory :project do
    name Faker::Name.name
    description Faker::Lorem.sentence(10)
    short_content Faker::Lorem.sentence(10)
    content Faker::Lorem.sentence(10)
    features Faker::Lorem.sentence(10)

    trait :randkowa do
      name 'Randkowa'
      slug 'randkowa'
      images_count 6
    end
  end
end
