class KickstartsController < ApplicationController
  before_action :set_kickstart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /kickstarts
  # GET /kickstarts.json
  def index
    @kickstarts = Kickstart.all
  end

  # GET /kickstarts/1
  # GET /kickstarts/1.json
  def show
  end

  # GET /kickstarts/new
  def new
    @profile = current_user.profile
    @kickstart = current_user.his_crew.kickstarts.build
  end

  # GET /kickstarts/1/edit
  def edit
  end

  # POST /kickstarts
  # POST /kickstarts.json
  def create
    end_time =
    @kickstart = current_user.his_crew.kickstarts.build(kickstart_params)

    respond_to do |format|
      if @kickstart.save
        add_participant @kickstart
        format.html { redirect_to @kickstart, notice: 'Kickstart was successfully created.' }
        format.json { render :show, status: :created, location: @kickstart }
      else
        format.html { render :new }
        format.json { render json: @kickstart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kickstarts/1
  # PATCH/PUT /kickstarts/1.json
  def update
    respond_to do |format|
      if @kickstart.update(kickstart_params)
        format.html { redirect_to @kickstart, notice: 'Kickstart was successfully updated.' }
        format.json { render :show, status: :ok, location: @kickstart }
      else
        format.html { render :edit }
        format.json { render json: @kickstart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kickstarts/1
  # DELETE /kickstarts/1.json
  def destroy
    @kickstart.destroy
    respond_to do |format|
      format.html { redirect_to kickstarts_url, notice: 'Kickstart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kickstart
      @kickstart = Kickstart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kickstart_params
      params.require(:kickstart).permit(:coaches_crew_id, :crew_id, :start_time, :start_time_date, :start_time_time, :end_time)
    end
end
