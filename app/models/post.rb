class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :title, :text, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, :likes_counter, presence: true, numericality: { other_than: 0 }

  def self.update_counter(post)
    post.comments_counter = post.comments.count
    post.likes_counter = post.likes.count
    post
  end

  def self.most_recent(post_id)
    @posts = Post.find_by(id: post_id)
    @posts = Post.update_all(@posts)
    @comments = @posts.comments.limit(3)
    @likes = @posts.likes.limit(3)
  end

  def self.all_comments(post_id)
    @posts = Post.find_by(id: post_id)
    @posts = Post.update_all(@posts)
    @comments = @posts.comments
    @likes = @posts.likes
  end

  def self.update_all(posts)
    updated_posts = []
    posts.each do |p|
      updated_posts << Post.update_counter(p)
    end
    updated_posts
  end
end
