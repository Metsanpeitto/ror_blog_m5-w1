class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, Post, Comment
    else
      can :read, Post, Comment
    end
  end
end
