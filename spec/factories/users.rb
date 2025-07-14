FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    lessons_count { rand(1..300) }
    tickets_solved_count { rand(lessons_count..(lessons_count + 300)) }
    role { User.roles.except(:batch_manager).keys.sample }
    image_url { Faker::Avatar.image }
    batch_count { rand(1..2100) }
    available { [true, false].sample }
    prefered_topic { User::TOPICS.sample }
  end

  trait :batch_manager do
    email { "admin@lewagon.com"}
    password { "vivelemarathon"}
    password_confirmation { "vivelemarathon" }
    first_name { "Sophie "}
    last_name { "Admin" }
    role { :batch_manager }
  end

  trait :without_image do
    image_url { nil }
  end
end
