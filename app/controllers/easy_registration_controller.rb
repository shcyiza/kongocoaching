class EasyRegistrationController < ApplicationController
  before_action :current_crew

  def sign_up
  #this controller method use omniauth for a one click registration
  end

  def create_profile
    # retrieve all the info from the omniauth provider
    #where using links params to perform this trick
    if current_user
      Profile.where(user: current_user, crew_id: params[:crew_id] ).first_or_create do |profile|
        profile.birth_date = params[:birthdate] or nil
        if params[:gender] == nil
        elsif params[:gender] == "male"
          profile.sex = false
        elsif params[:gender] == "female"
          profile.sex = true
        else
          profile.sex = nil
        end
      end
      redirect_to "/#{@crew_as_client.id}/easy_register/confirm_info"
    end
  end

  def confirm_info
  # the client just have to confirm them
    @user = current_user
    @profile = current_user.profile
    authorize! :update, @profile
  end

  def submit_profile
    @user = current_user
    @profile = current_user.profile

    respond_to do |format|
      if @user.update(user_params)
        @profile.update_attributes!(profile_params)
        format.html { redirect_to '/1/kickstarts/new', notice: 'La dernière étape!!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_back fallback_location: root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update, @profile
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def profile_params
    params.require(:profile).permit(:birth_date, :sex, :phonenr, :address)
  end

  def current_crew
    @crew_as_client = Crew.find(params[:crew_id])
  end
end
