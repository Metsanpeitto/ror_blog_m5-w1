class Comment < ApplicationRecord
  belongs_to :user, :post
  validates :text, presence: true
end
