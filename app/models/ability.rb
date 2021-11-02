class Ability
  include CanCan::Ability

  def initialize(user)
    # Handle the case where we don't have a current_user i.e. the user is a guest
    user ||= User.new
    byebug
    # Define User abilities
    if user.is? :admin
      can :manage, Post, Comment
    else
      can :read, Post, Comment
    end
  end
end
