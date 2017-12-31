class AnnoncementsController < CrewsController
  require 'timeout'
  before_action :set_crew
  before_action :set_annoncement, except: [:new, :create, :index]

  def index
    @annoncements = @crew.annoncements
  end

  def show
    #code
  end

  def new
    @annoncement = @crew.annoncements.build
  end

  def edit
    #code
  end

  def create
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
  def set_annoncement
    @annoncement = Annoncement.find(params[:id])
  end

  def profile_variable_params
    params.require(:profile_variable).permit(:profile_id, :name, :variable)
  end
end
