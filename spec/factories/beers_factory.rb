FactoryBot.define do
  factory :beer do
    name { Faker::Beer.unique.name }
    tagline { Faker::Beer.brand }
    description { Faker::Beer.style }
    abv { rand(1.0..10.0).round(1) }
  end
end

