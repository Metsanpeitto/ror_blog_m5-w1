class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true
    can :read, Comment, public: true
    can :write, Comment, public: true

    return unless user.present? # additional permissions for logged in users (they can manage their own posts)

    can :read, Post
    can :manage, Post, user_id: user.id
    can :manage, Comment

    return unless user.role == 'admin' # additional permissions for administrators

    can :manage, Post, user_id: user.id
    can :manage, Comment
  end
end
