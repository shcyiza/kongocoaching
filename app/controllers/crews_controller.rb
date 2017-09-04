class CrewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crew, :except => [:index]
  # GET /crews
  # GET /crews.json

  def index
    @crews = Crew.all
    authorize! :index, @crews
  end

  # GET /crews/1
  # GET /crews/1.json
  def show
    @club = @crew.club
  end

  def planner
    @base_kickstars = @crew.confirmed_kickstars
    @kickstart_count = @base_kickstars.count
    @kickstarts = @base_kickstars.paginate(:page => params[:page], :per_page => 7)
    authorize! :show, @crew
  end

  def kickstarts
    @base_kickstars = @crew.unconfirmed_kickstars
    @kickstart_count = @base_kickstars.count
    @kickstarts = @base_kickstars.paginate( page: params[:page], per_page: 7 )
    authorize! :show, @crew
  end


  def coaches
    @coaches = @crew.coaches_crews.paginate( page: params[:page], per_page: 8 )
    @new_coaches_crew = @crew.coaches_crews.build
    authorize! :show, @crew
  end

  def services
    @services = @crew.training_types.paginate( page: params[:page], per_page: 6 )
    @new_service = @crew.training_types.build
    authorize! :show, @crew
  end

  def clubs
    @clubs = @crew.clubs
  end

  def club_show
    @club = Club.find(params[:key])
  end

  def club_new
    @club = @crew.clubs.build
  end

  def add_club
    @club = @crew.clubs.build(club_params)
    respond_to do |format|
      if @club.save
        format.html { redirect_to "/crews/#{@crew.id}/clubs" , notice: 'Club was successfully created.' }
        format.json { render :club_show, status: :created, location: @club }
        ClubsCrew.create! crew: @crew, club: @club
      else
        format.html { redirect_back fallback_location: root_path, alert: 'Erreur, réessayé.' }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def club_edit
    @club = Club.find(params[:key])
  end

  def add_cc
    @new_coaches_crew = @crew.coaches_crews.build(coaches_crew_params)
    if @new_coaches_crew.save
      #create the default avatars
      add_avatar @new_coaches_crew, coaches_crew_params[:photo], coaches_crew_params[:vignette], true
    end
    respond_to do |format|
      if @new_coaches_crew.id != nil
        format.html { redirect_back fallback_location: root_path, notice: 'Training type was successfully created.' }
        format.json { render :show, status: :created, location: @new_coaches_crew }
        format.js
      else
        format.html { redirect_back fallback_location: root_path, alert: 'Erreur, réessayé.' }
        format.json { render json: @new_coaches_crew.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit_cc
    @coaches_crew = CoachesCrew.find(params[:key])
    respond_to do |format|
      if @coaches_crew.update(coaches_crew_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Edité avec success.' }
        format.json { render :show, status: :ok, location: @crew }
      else
        format.html { redirect_back fallback_location: root_path, notice: 'Erreur, contacter le Patrick Cyiza.' }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_cc
    @coaches_crew = CoachesCrew.find(params[:key])
    @coaches_crew.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Coach bien supprimé.' }
      format.json { head :no_content }
    end
  end

  def add_service
    @new_service = @crew.training_types.build(training_type_params)
    if @new_service.save
      #create the default avatars
      add_avatar @new_service, training_type_params[:photo], training_type_params[:vignette], true
    end
    respond_to do |format|
      if @new_service.id != nil
        format.html { redirect_back fallback_location: root_path, notice: 'Le service a bien été créer.' }
        format.json { render :show, status: :created, location: @new_service }
        format.js
      else
        format.html { redirect_back fallback_location: root_path, alert: 'Erreur, réessayé.' }
        format.json { render json: @new_service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def destroy_service
    @service = TrainingType.find(params[:key])
    @service.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Le service a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  # GET /crews/new
  def new
    @crew = current_user.coordinator.crews.build
    authorize! :create, @crew
  end

  # GET /crews/1/edit
  def edit
    authorize! :update, @crew
  end

  # POST /crews
  # POST /crews.json
  def create
    @crew = Crew.new(crew_params)
    respond_to do |format|
      if @crew.save
        format.html { redirect_to @crew, notice: 'Crew was successfully created.' }
        format.json { render :show, status: :created, location: @crew }
      else
        format.html { render :new }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
    authorize! :create, @crew
  end

  # PATCH/PUT /crews/1
  # PATCH/PUT /crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to @crew, notice: 'Crew was successfully updated.' }
        format.json { render :show, status: :ok, location: @crew }
      else
        format.html { render :edit }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
    authorize! :update, @crew
  end

  # DELETE /crews/1
  # DELETE /crews/1.json
  def destroy
    @crew.destroy
    respond_to do |format|
      format.html { redirect_to crews_url, notice: 'Crew was successfully destroyed.' }
      format.json { head :no_content }
    end
    authorize! :destroy, @crew
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew
      @crew = Crew.find(params[:id])
      authorize! :show, @crew
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_type_params
      params.require(:training_type).permit(:name, :description, :duration_hours, :duration_minutes, :photo, :vignette,
                                            avatars_attributes: [:photo, :vignette],
                                            video_links_attributes: [:video_path]
                                            )
    end


    def coaches_crew_params
      params.require(:coaches_crew).permit(:name, :description, :photo, :vignette,
                    training_type_ids: [],
                    avatars_attributes: [:photo, :vignette],
                    video_links_attributes: [:video_path]
                    )
    end

    def club_params
      params.require(:club).permit(:name, :address)
    end
end
