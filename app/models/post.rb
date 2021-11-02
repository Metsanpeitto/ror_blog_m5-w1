class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :title, :text, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, :likes_counter, presence: true, numericality: { other_than: 0 }

  def self.update_counter(user_id)
    num_posts = Post.where(user_id: user_id).count
    User.find_by(id: user_id).update(post_counter: num_posts)
  end

  def self.most_recent(post_id)
    @comments_raw = Comment.where(post_id: post_id).order(created_at: :desc).limit(5)
    pair_user_comment(post_id)
  end

  def self.all_comments(post_id)
    @comments_raw = Comment.where(post_id: post_id).order(created_at: :desc)
    pair_user_comment(post_id)
  end

  def self.pair_user_comment(_post_id)
    comments = []
    if @comments_raw.size.positive?
      @comments_raw.each do |comment|
        user = User.find_by(id: comment.user_id)
        data = [user.name, comment]
        comments << data
      end
    end
    comments
  end

  def self.likes_comments(post)
    post[:likes_counter] = Like.where(post_id: post.id).count
    post[:comments_counter] = Comment.where(post_id: post.id).count
    post
  end
end
