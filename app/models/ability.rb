class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    byebug
    # Define User abilities
    if user.is? :admin
      can :manage, Post, Comment
    else
      can :read, Post, Comment
    end

    if user.present? 
      can :manage, Post, Comment
    end
  end
end
