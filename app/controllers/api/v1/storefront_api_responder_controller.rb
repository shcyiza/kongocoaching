class Api::V1::StorefrontApiResponderController < Api::V1::ApiBaseController
  before_action :restrict_access

  def restrict_access
    public_key = request.headers["HTTP_PUBLIC_KEY"]
    private_key = request.headers["HTTP_SECRET_KEY"]
    @authorize_crew_id = CrewStorefrontKey.check_credentials_and_return_crew public_key, private_key
    if @authorize_crew_id == false
      respond_with_error(401, 'Bad credentials')
    else
      @crew =  Crew.find(@authorize_crew_id)
    end
  end

  def index
   render :partial => "api/v1/storefront/index.json"
  end


end
