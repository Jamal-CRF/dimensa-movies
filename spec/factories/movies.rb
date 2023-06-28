FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Movie #{n}" }
    genre { Faker::Book.genre }
    year { Faker::Number.between(from: 1900, to: 2023) }
    country { Faker::Address.country }
    published_at { Faker::Date.between(from: 50.years.ago, to: Date.today) }
    description { Faker::Lorem.sentence }
  end
end
