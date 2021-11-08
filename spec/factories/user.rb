FactoryBot.define do
  sequence :email do |n|
    "mail#{n}@gmail.com"
  end

  sequence :name do |n|
    "Aarnio #{n}"
  end

  factory :user do
    name
    email
    password { '123456' }
    password_confirmation { '123456' }
    photo { 'https://imgur.9823432/' }
    bio { 'Lots of things to say in here' }
    role { 'default' }
    post_counter { 5 }
    email_confirmed { true }
    confirm_token { true }
    confirmed_at { Time.now }

    factory :user_with_posts do
      transient do
        post_count { 5 }
      end

      posts do
        Array.new(post_count) { association(:post) }
      end
    end
  end
end
