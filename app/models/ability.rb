# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # if user!=nil
    #   user ||= User.new # guest user (not logged in)
    if user.Admin
      can :manage, :all
    else
      # Event.where("lower(name) LIKE ?", "%#{@parameter}%" ).or(Event.where("lower(description) LIKE ?", "%#{@parameter}%" ))
      if Guest.where(user_id: user.id).where(owner: true).first!=nil
        Guest.where(user_id: user.id).where(owner: true).each do |h|
          can :manage,Event, id: h.event_id
        end
      end
      if Membership.where(user_id: user.id).where(owner: true).first!=nil
        Membership.where(user_id: user.id).where(owner: true).each do |h|
          can :manage,Organization, id: h.organization_id
        end
      end
      can :manage,User, id: user.id
      can :create,Event
      can :create,Organization
      can :read, :all
    end
    # end
    #
    # The first argument to can is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end