class User < ApplicationRecord
  before_create :confirmation_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :confirmable

  has_many :comments, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  validates :name, presence: true, allow_blank: false
  validates :photo, :bio, :email, presence: true
  validates :post_counter, presence: true, numericality: { other_than: 0 }

  Roles = %i[admin default]

  def is?(requested_role)
    role == requested_role.to_s
  end

  def self.obtain_last_posts(id)
    Post.where(user_id: id).limit(3)
  end

  def self.obtain_all_posts(id)
    Post.where(user_id: id)
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end
