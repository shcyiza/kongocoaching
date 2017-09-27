class EasyRegistrationController < ApplicationController
  before_action :current_crew

  def sign_up
  #this controller method use omniauth for a one click registration
  end

  def create_profile
    # retrieve all the info from the omniauth provider
    #where using links params to perform this trick
    Profile.where(user_id: current_user.id, crew_id: @crew_as_client.id ).first_or_create do |profile|
      profile.birth_date = params[:birthday] or nil
      if params[:gender] == nil
      elsif params[:gender] == "male"
        profile.sex = false
      else
        profile.sex = true
      end
    end
    redirect_to "/#{@crew_as_client.id}/easy_register/confirm_info"
  end

  def confirm_info
  # the client just have to confirm them
    @user = current_user
    @profile = current_user.profile
  end

  def current_crew
    @crew_as_client = Crew.find(params[:crew_id])
  end
end
