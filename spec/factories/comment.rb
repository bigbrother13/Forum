FactoryBot.define do
  factory :comment do
  	association :user
    association :topic
    comment { Faker::Lorem.paragraph }
  end
end

