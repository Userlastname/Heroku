FactoryBot.define do
  factory :user do
    sequence(:phone) { |n| "123456789#{n}" }
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    password { 'password123' }
  end
end
