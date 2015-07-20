FactoryGirl.define do
  factory :testimonial do
    content { Faker::Lorem.sentence }
    author { Faker::Name.name }
    company { Faker::Company.name }
  end
end
