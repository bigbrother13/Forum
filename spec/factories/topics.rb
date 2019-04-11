FactoryBot.define do
  factory :topic do
    association :user
    title   { Faker::Lorem.sentence }
    content { Faker::Lorem.question }
  end
end
