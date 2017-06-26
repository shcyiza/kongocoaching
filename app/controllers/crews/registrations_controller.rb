class Crews::RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    yield resource if block_given?
    self.resource.profile = Profile.new
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      user_attr = params[:profile]
      @crew = Crew.find(user_attr[:crew_id])
      Profile.create( user: resource, phonenr: user_attr[:phonenr], birth_date: user_attr[:birth_date], birth_date: user_attr[:birth_date], sex: user_attr[:sex], crew: @crew )
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_to do |format|
          format.html { redirect_to new_kickstar_path, notice: 'La dernière étape!!' }
        end
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private


  def sign_up_params
    allow = [:email, :name, :password, :password_confirmation, profile: [:phonenr, :birth_date, :sex, :crew_id]]
    params.require(resource_name).permit(allow)
  end

end
