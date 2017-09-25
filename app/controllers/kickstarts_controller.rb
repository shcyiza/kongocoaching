class KickstartsController < ApplicationController
  before_action :set_kickstart, only: [:show, :edit, :update, :admin_confirmation, :destroy]
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
    @kickstart = current_user.his_crew_as_client.kickstarts.build
  end

  # GET /kickstarts/1/edit
  def edit
  end

  # POST /kickstarts
  # POST /kickstarts.json
  def create
    @kickstart = current_user.his_crew_as_client.kickstarts.build(kickstart_params)
    if @kickstart.save
      add_participant @kickstart
      set_as_confirmable @kickstart
      if @kickstart.participant && @kickstart.is_confirmable?
        respond_to do |format|
          format.js #remote true enable this send sends ajax callbacks
        end
      else
        # redirect to and error page
        format.json { render json: @kickstart.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @kickstart.errors, status: :unprocessable_entity }
      end
    end
  end

  def after_creation_actions
    @kickstart = current_user.his_kickstart_as_client
    NewKickstartMailer.new_registered_kickstart(current_user).deliver_now
    respond_to do |format|
      format.html { redirect_to "/1/kickstarts/#{@kickstart.id}", notice: "Votre RDV à bien été pris et attend une confirmation de la date et de l'heure." }
      format.json { render :show, status: :created, location: @kickstart }
    end
  end

  def add_motivation
    @profile = current_user.profile
    @profile.update( motivation: params[:profile][:motivation] )
    after_creation_actions
  end

  # PATCH/PUT /kickstarts/1
  # PATCH/PUT /kickstarts/1.json
  def update
    respond_to do |format|
      if @kickstart.update(kickstart_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Kickstart was successfully updated.' }
        format.json { render :show, status: :ok, location: @kickstart }
      else
        format.html { render :edit }
        format.json { render json: @kickstart.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_confirmation
    respond_to do |format|
      if @kickstart.update(kickstart_params)
        confirm_this @kickstart
        if @kickstart.is_confirmed?
          format.html { redirect_back fallback_location: root_path, notice: 'RDV pour le Kickstart a bien été confirmé.' }
          format.json { render :show, status: :ok, location: @kickstart }
        else
          # redirect to and error page
          format.json { render json: @kickstart.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_back(fallback_location: root_path) }
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
      params.require(:kickstart).permit(
      :coaches_crew_id,
      :crew_id,
      :start_time,
      :start_time_date,
      :start_time_time,
      :start_time_min,
      :start_time_hour,
      :end_time
      )
    end
end
