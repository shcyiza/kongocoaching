class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @users_gender = request.env["omniauth.auth"].extra.raw_info.gender
    @users_birthday = request.env["omniauth.auth"].extra.raw_info.birthday
    if @user.persisted?
      after_success_actions
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      after_success_actions
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def after_success_actions
    sign_in @user, event: :authentication
    origin = URI(request.referer || '').path
    @return_to = origin
    @params_string = "?birthday=#{@users_birthday}&gender=#{@users_gender}"
    render "users/_callbacks", layout: false
  end

  def failure
    redirect_back fallback_location: root_path, alert: "Oops, ca c'est mal passé, réessayé..."
  end

end
