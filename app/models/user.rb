class User < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :trainings, through: :participants, source: :enrollable, source_type: "Training" #As a client he can participates to many trainings
  has_many :kickstarts, through: :participants, source: :enrollable, source_type: "Kickstart" #As a client he can do many kickstart
  has_one :sudo, dependent: :destroy
  has_one :coordinator, dependent: :destroy #a user can be a crew coordinator only once
  has_one :coach, dependent: :destroy #a user be assigned coach only once
  has_many :crews, through: :coordinator #As a coordinator which crew does he manage?
  has_many :coaches_crews, through: :coach #As a coach for what crews is he working?
  # Training belongs to coaches_crew so we can keep track of what crew organize the training session and what coaches trains him
  has_one :profile, dependent: :destroy
  #having user attributes and his profile's attributes at the same place
  accepts_nested_attributes_for :profile
  has_many :profile_variables, through: :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
   #validation for omniauth
  validates_presence_of :uid, on: :from_omniauth
  validates_presence_of :provider, on: :from_omniauth
  validates_uniqueness_of :uid, scope: :provider, on: :from_omniauth

  #Method for the OmniAuth strategies with devise
  #check https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
     user.image = auth.info.image
   end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def gender
    gender = "homme"
    if self.profile.sex == true
      gender = "femme"
    end
    return gender
  end

  def age
    now = Time.now.to_date
    dob = self.profile.birth_date
    base_year = now.year-dob.year
    result = base_year
    if now.month <= dob.month && now.day <= dob.day
      result = base_year - 1
    end
    return result
  end

  def tel
    tel = "Pas de numéro de telephone"
    if self.profile.phonenr
      tel = self.profile.phonenr
    end
    return tel
  end

# ---------------------Methods for coordinators--------------
   def coordinator? #is the selected user a coordinator?
     result = false
     if self
       if self.id != nil && self.coordinator
         result = true
       end
     end
     return result
   end

   def chief_id # Method to find the id of coordinator id
     if self.coordinator?
       return self.coordinator.id
     else
       return false
     end
   end

   def has_crew?
    result = false
    if self.coordinator? && Crew.where(coordinator_id: self.chief_id).count >= 1
     result = true
    end
    return result
   end

   def crew_owner?(crew) #is the selected user the owner of a particular crew
     if self.coordinator? && crew.coordinator_id == self.chief_id
       return true
     else
       return false
     end
   end

   def his_crew_as_coord
     if self.coordinator? && has_crew?
       return self.coordinator.crews.last
     else
       return false
     end
   end

   def all_crew_as_coord
     if self.coordinator? && has_crew?
       return current_user.coordinator.crews
     else
       return false
     end
   end
# ------------------------methods for coaches--------------------------------------
   def coach? #is the selected user a coach or a coordinator (in the real world coordinators often gives training too)
     if self.coach
       return true
     else
       return false
     end
   end

   def coach_for?(crew)
     if self.coach? && self.coach.crews.include?(crew)
       return true
     else
       return false
     end
   end

  def trains_client?(client)
    result = false
    if self.coach? && self.coach.coaches_crews.include?(client.profile.coaches_crew)
      result = true
    end
    return result
  end

  def trains_this_profile?(profile)
    result = false
    if self.coach? && self.coach.coaches_crews.include?(profile.coaches_crew)
      result = true
    end
    return result
  end

  def his_crews_as_coaches
    result = false
    if self.coach? &&  self.coach.crews != nil
      result = self.coach.crews
    end
    return result
  end
#----------------------methods for client --------------------------------
  def client? #is he a client??
    result = false
    if self.profile
      result = true
    end
    return result
  end

  def client_of?(crew)
    result = false
    if self.client? &&  self.profile.crew == crew
      result = true
    end
    return result
  end

  def his_crew_as_client
    result = false
    if self.client? &&  self.profile.crew != nil
      result = self.profile.crew
    end
    return result
  end

  def his_kickstart_as_client
    result = false
    if self.client?
      result = self.kickstarts.last
    end
    return result
  end

  def all_kickstart_as_client
    result = false
    if self.client?
      result = self.kickstarts
    end
    return result
  end

#----------------------methods for all -----------------------------------
  def sudo? #is he a client??
    result = false
    if self.sudo
      result = true
    end
    return result
  end

  def actif?
    if CoachesCrew.where(coach_id: self.coach.id).count >= 1 || self.has_crew?
      return true
    else
      return false
    end
  end

  def affiliated_to?(crew)
    result = false
    if self.crew_owner?(crew) || self.coach_for?(crew) || self.client_of?(crew)
      result = true
    end
    return result
  end

end
