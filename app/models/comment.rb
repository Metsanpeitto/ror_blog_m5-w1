class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  validates :text, presence: true

  def self.update_counter(post_id)
    num_comments = Comment.where(post_id: post_id).count
    Post.find_by(id: post_id).update(comments_counter: num_comments)
  end
end
