FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    department { DEPARTMENTS.sample }
    # password { BCrypt::Password.create('password') }
    password { 'password' }
    sequence(:email) { Faker::Internet.email }
    designation { Faker::Job.title }
    wants_to_go_lunch { true }
  end
end
