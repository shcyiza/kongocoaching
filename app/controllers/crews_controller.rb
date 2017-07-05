class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy, :sign_up]
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

  def sign_up

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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_params
      params.fetch(:crew, {})
    end
end
