class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?

    can(:manage, Inventory, user:)
    can(:manage, Recipe, user:)
    can :manage, Food, user:

    # return unless user.is? :admin

    # can :manage, :all
  end
end
