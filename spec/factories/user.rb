FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    token { Faker::Internet.password }
    google_id { Faker::Internet.password }
  end
end