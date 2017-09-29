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

  def google_profile_info(token)
    if Rails.env.production?
      app_id = ENV['GOOGLE_PRODUCTION_APP_ID']
      app_secret = ENV['GOOGLE_PRODUCTION_APP_SECRET']
    else
      app_id = Rails.application.secrets[:google_dev_app_id]
      app_secret = Rails.application.secrets[:google_dev_secret]
    end
    api_endpoint = "https://www.googleapis.com/plus/v1/people/me"
    client = OAuth2::Client.new(app_id, app_secret, site: api_endpoint)
    hash_token = OAuth2::AccessToken.new(client, token)
    info_hash = JSON.parse(hash_token.get(api_endpoint).body)
    @raw_info = info_hash
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.profile == nil
      google_profile_info(request.env['omniauth.auth'].credentials.token)
      @users_birthday = @raw_info["birthday"]
      @users_gender = @raw_info["gender"]
    end
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
    @params_string = "?birthdate=#{@users_birthday}&gender=#{@users_gender}"
    render "users/_callbacks", layout: false
  end

  def failure
    redirect_back fallback_location: root_path, alert: "Oops, ca c'est mal passé, réessayé..."
  end

end
