FactoryBot.define do
  factory :user do
    email { 'example@gmail.com' }
    password { '1234567' }
    password_confirmation { '1234567' }
  end
end
