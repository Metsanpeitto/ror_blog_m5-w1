class User < ApplicationRecord
  before_create :confirmation_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  validates :name, presence: true, allow_blank: false
  validates :photo, :bio, :email, presence: true
  validates :post_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # rubocop: disable all
  Roles = %i[admin default].freeze
  # rubocop: enable all

  def is?(requested_role)
    role == requested_role.to_s
  end

  def obtain_last_posts(id)
    @user = User.find_by(id: id)
    @posts = @user.posts.limit(3)
  end

  def obtain_all_posts(id)
    @user = User.find_by(id: id)
    @posts = @user.posts
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end
