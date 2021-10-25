class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :likes
  validates :title, :text, presence: true
end
