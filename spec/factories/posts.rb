FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence(2)
    content Faker::Lorem.sentence(10)
  end
end
