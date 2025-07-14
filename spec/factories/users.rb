FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    tickets_solved_count { rand(0..500) }
    role { User.roles.except(:batch_manager).keys.sample }
    image_url { Faker::Avatar.image }
    batch_count { rand(1..2100) }
    available { [true, false].sample }
    lessons_count { rand(1..300) }
  end
end
