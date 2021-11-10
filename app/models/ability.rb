class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.role == 'admin'
      can :manage, Post
      can :manage, Comment

    elsif user.present?
      can :manage, Post, user: user
      can :manage, Comment, user: user
    else
      can :read, Post
      can :read, Comment
    end
  end
end
