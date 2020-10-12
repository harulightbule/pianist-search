FactoryBot.define do
  factory :pianist do
       school    { "aa大学" }
       repert    { "曲名" }
       area      { "愛知" }
       money     { "1回3000円" }
       message   { "よろしく" }
       video     { "http/" }
       association :user

       after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
