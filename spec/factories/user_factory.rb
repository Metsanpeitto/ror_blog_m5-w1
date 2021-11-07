FactoryBot.define do
  factory :user do
    name { 'Joe' }
    email { 'joe@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
    photo { 'https://imgur.9823432/' }
    bio { 'Lots of things to say in here' }
    role { 'default' }
    post_counter { 6 }

    factory :user_posts do
      posts do
        Array.new(6) { association(:post) }
      end
    end
  end
end
