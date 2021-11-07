class Ability
  include CanCan::Ability

  def initialize(user)
    # return unless user.present? # additional permissions for logged in users (they can manage their own posts)

    # can :manage, Post
    # can :manage, Comment

    # return unless user.role == 'admin' # additional permissions for administrators

    # can :manage, Post, user_id: user.id
    # can :manage, Comment
  end
end
