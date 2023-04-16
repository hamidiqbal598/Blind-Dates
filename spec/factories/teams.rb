FactoryBot.define do
  factory :team do
    name { Faker::Lorem.words(number: 3).join(' ') }
    leader
  end
end
