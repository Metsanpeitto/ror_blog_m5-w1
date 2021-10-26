class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, :text, presence: true

  def self.update_counter(user_id)
    num_posts = Post.where(user_id: user_id).count
    User.find_by(id: user_id).update(post_counter: num_posts)
  end

  def self.most_recent(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).limit(5)
  end

  def self.all_comments(post_id)
    comments_raw = Comment.where(post_id: post_id).order(created_at: :desc)
    comments = []
    if comments_raw.size.positive?
      comments_raw.each do |comment|
        user = User.find_by(id: comment.user_id)
        data = [user.name, comment]
        comments << data
      end
    end
    comments
  end
end
