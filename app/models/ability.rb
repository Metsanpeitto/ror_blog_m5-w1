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

    can :manage, Post, Comment if user.present?
  end
end
