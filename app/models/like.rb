class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.increment(user_id, post_id)
    Like.create(user_id: user_id, post_id: post_id)
  end

  def self.update_counter(post_id)
    num_likes = Like.where(post_id: post_id).count
    Post.find_by(id: post_id).update(likes_counter: num_likes)
  end
end
