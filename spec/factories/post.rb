FactoryBot.define do
  factory :post do
    user
    title { 'The title' }
    text { 'Test rest of the text' }

    factory :post_with_comments do
      transient do
        comments_counter { 5 }
      end

      comments do
        Array.new(comments_counter) { association(:comment) }
      end

      factory :post_with_comments_and_likes do
        transient do
          likes_counter { 5 }
        end

        likes do
          Array.new(likes_counter) { association(:like) }
        end
      end
    end
  end
end
