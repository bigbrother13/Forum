FactoryBot.define do
  factory :comment do
    comment1 { Faker::Lorem.paragraph }
    comment2 { Faker::Lorem.paragraph }
  end
end
