FactoryBot.define do
  factory :review do
    association :user
    association :movie
    comment {'such a wonderful movie'}
  end
end
