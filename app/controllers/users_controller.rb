class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def index
    @users = User.all
  end

  def show
    @requested_user = User.find(params[:id])
    unless @requested_user == @user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def edit_profile
    @profile = Profile.find_or_initialize_by(user_id: @user.id)
  end

  def update_profile
    @profile = Profile.find_or_initialize_by(user_id: @user.id, crew_id: params[:id])

    respond_to do |format|
      if @user.update(user_params)
        @profile.update_attributes!(profile_params)
        format.html { redirect_to @user, notice: 'Profile modifier avec success.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit_profile }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def profile_params
    params.require(:profile).permit(:birth_date, :sex, :phonenr, :address, :crew_id)
  end

end
