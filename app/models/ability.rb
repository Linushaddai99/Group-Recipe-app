class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?

    can :manage, Inventory, user: user
    can :manage, Recipe, user: user
    can :manage, Food, user: user

    #return unless user.is? :admin

    #can :manage, :all
    
  end
end
