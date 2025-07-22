FactoryBot.define do
  factory :image do
    title { Faker::Lorem.words(number: 3).join(" ") }
    url { Faker::Internet.url }

    association :commentable, factory: :post


  end
end
