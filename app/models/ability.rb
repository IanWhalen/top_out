class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user.admin?
      can :create, Problem
    else
      can :read, :all
      can :manage, :all
      cannot :create, Problem
    end
  end
end
