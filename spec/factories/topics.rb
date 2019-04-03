FactoryBot.define do
  factory :topic do
    association :user
    title   { 'Topic' }
    content { 'Some text' }
  end
end

