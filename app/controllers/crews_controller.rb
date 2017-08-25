class CrewsController < ApplicationController
  before_action :set_crew, :except => [:index]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
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
    @coaches = @crew.its_coaches
    @new_cp = @crew.coach_placeholders.build #cp are coache placeholders
    authorize! :show, @crew
  end

  def services
    @services = @crew.training_types
    @new_service = @crew.training_types.build
    authorize! :show, @crew
  end

  def add_cp #cp are coache placeholders
    @new_cp = @crew.coach_placeholders.build(cp_params)
    if @new_cp.save
      add_avatar cp_params[:photo_params], @new_cp
    end
    respond_to do |format|
      if @new_cp.save
        format.html { redirect_back fallback_location: root_path, notice: 'Training type was successfully created.' }
        format.json { render :show, status: :created, location: @new_cp }
        format.js
      else
        format.html { render :new }
        format.json { render json: @new_cp.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy_cp
    #code
    authorize! :show, @crew
  end

  def add_coach
    #code
    authorize! :show, @crew
  end

  def destroy_coach
    #code
    authorize! :show, @crew
  end

  def add_service
    @new_service = @crew.training_types.build(training_type_params)
    respond_to do |format|
      if @new_service.save
        format.html { redirect_back fallback_location: root_path, notice: 'Training type was successfully created.' }
        format.json { render :show, status: :created, location: @new_service }
        format.js
      else
        format.html { render :new }
        format.json { render json: @new_service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete_coaches
    #code
  end

  def delete_training_types
    #code
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
      params.require(:training_type).permit(:name, :description, :duration_hours, :duration_minutes,
                                            avatars_attributes: [:photo],
                                            video_links_attributes: [:video_path]
                                            )
    end

    #cp means coach_placesholder
    def cp_params
      params.require(:coach_placeholder).permit(:name, :description, :photo_params,
                    video_links_attributes: [:video_path]
                    )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_params
      params.fetch(:crew, {})
    end
end
