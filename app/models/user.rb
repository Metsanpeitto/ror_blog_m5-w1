class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  validates :name, presence: true, allow_blank: false
  validates :photo, :bio, presence: true
  validates :post_counter, presence: true, numericality: { other_than: 0 }

  # rubocop: disable_all
  Roles = %i[admin default]
  # rubocop: enable_all
  def is?(requested_role)
    role == requested_role.to_s
  end

  def self.obtain_last_posts(id)
    Post.where(user_id: id).limit(3)
  end

  def self.obtain_all_posts(id)
    Post.where(user_id: id)
  end
end
