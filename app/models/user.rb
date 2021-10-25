class User < ApplicationRecord
  has_many :tasks, :comments, :posts
  validates :name, :photo, :bio, presence: true

  def last_posts
    byebug
    posts = Post.find(:user).limit(3)
    p posts
  end
end
