class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user.admin?
      can :read, :all
      can :manage, :all
      can :create, [Problem, Wall]
      can :clear, [Wall]
    else
      can :read, :all
      can :manage, :all
      cannot :create, [Problem, Wall]
      cannot :clear, [Wall]
    end
  
  end
end
