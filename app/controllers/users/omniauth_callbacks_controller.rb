class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    respond_to do |format|
      if @user.persisted?
        format.html { sign_in_and_redirect @user, event: :authentication }#this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    respond_to do |format|
      if @user.persisted?
        format.html { sign_in_and_redirect @user, event: :authentication }
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
  end

  def failure
    redirect_to root_path, alert: "Oops, ca c'est mal passé..."
  end

end
