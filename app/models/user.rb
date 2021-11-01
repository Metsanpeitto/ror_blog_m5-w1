class User < ApplicationRecord
  has_many :comments
  has_many :posts

  def self.obtain_last_posts(id)
    Post.where(user_id: id).limit(3)
  end
end
