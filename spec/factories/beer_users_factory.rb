FactoryBot.define do
  factory :beer_user do
    association :user, factory: :user
    association :beer, factory: :beer
    date { "2019-11-11" }
    favorite { false}
    time { "2019-11-11 05:13:24" }
  end
end
