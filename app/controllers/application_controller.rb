class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_back(fallback_location: root_path, alert: "You don't have permission to access this page.")
  end

  def add_participant enrollable
    Participant.create! user: current_user, enrollable: enrollable
  end

  def add_avatar attachable, photo, vignette, *is_default
    @new_avatar = Avatar.new( photo: photo, vignette: vignette, attachable: attachable )
    @new_avatar.save
    if is_default || is_default == true
      @new_avatar.set_as_default
    end
  end

  def add_videolink link, watchable
    VideoLink.create! video_path: link, watchable: watchable
  end

  def set_as_confirmable confirmable
    Confirmation.create! confirmable: confirmable
  end

  def confirm_this confirmable
    confirmable.confirmation.update! confirmed: true, confirmed_by: current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
