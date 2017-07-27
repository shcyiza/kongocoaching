class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    role :coordinator, proc { |user| user.coordinator? } do
      can :create, Crew
      can :create, TrainingType
      cannot :index, Crew
      cannot :index, User
      can [:show, :update, :destroy], Crew do |crew, user|
        user.crew_owner?(crew) == true
      end
      can :create, CoachesCrew do |crew, user|
        user.has_crew? == true
      end
      can :destroy, CoachesCrew do |cc, user|
        user.crew_owner?(cc.crew) == true
      end
      can :create, Coach do |coach, user|
        user.has_crew? == true
      end
      can [:show], Profile do |profile, user|
        user.crew_owner?(profile.crew) == true
      end
    end



    # More privileged role, applies to registered users.
    #
    role :coach, proc { |user| user.coach? } do
      can [:show, :update], Profile do |profile, user|
        user.trains_this_profile?(profile) == true
      end
    end

    role :client, proc { |user| user.client? } do
      can [:show, :update], Profile do |profile, user|
        user == profile.user
      end
    end
    # The base role with no additional conditions.
    # Applies to every user.
    role :guest
    #  can :read, Post
    #  can :read, Comment
    end

end
