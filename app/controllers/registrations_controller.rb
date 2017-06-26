class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    yield resource if block_given?
    self.resource.profile = Profile.new
    respond_with resource
  end

end
