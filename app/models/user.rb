class User < ApplicationRecord
  has_many :tasks, :comments, :posts
  validates :name, :photo, :bio, presence: true
end
