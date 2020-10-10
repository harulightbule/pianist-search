FactoryBot.define do
  factory :user do
    name                  { "田中花子" }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
  end
end