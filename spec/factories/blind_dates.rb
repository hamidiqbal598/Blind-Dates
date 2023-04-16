FactoryBot.define do
  factory :blind_date do
    teams
    date { "2023-04-14 12:45:46" }
    restaurant { FAMOUS_RESTAURANTS.sample }
  end
end
