class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.system_admin?
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    else
      can :read, [Item, ItemType, Project]
      can :crud, [User], :id => user.id
      can :crud, [Registry], :id => user.registry_id
    end
  end
end
