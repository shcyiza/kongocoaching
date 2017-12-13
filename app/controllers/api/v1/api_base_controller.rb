class Api::V1::ApiBaseController < ActionController::Base
  include JsonApiResponders
  protect_from_forgery with: :null_session
  respond_to :json

end
