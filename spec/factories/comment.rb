FactoryBot.define do
  factory :comment do
    user
    post
    text { 'This comment tells lot of stuff in the form of, of course, a post.' }
  end

  factory :like do
    user
    post
  end
end
