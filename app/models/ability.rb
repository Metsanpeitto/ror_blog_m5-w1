class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role.eql? 'admin'
      can :manage, :all
    else
      can :manage, Post do |post|
        post.user_id == user.id
      end
      can :manage, Comment do |comment|
        comment.user_id == user.id
      end
      can :create, :all
      can :read, :all
    end
  end
end
