class KickstarsController < ApplicationController
  before_action :set_kickstar, only: [:show, :edit, :update, :destroy]

  # GET /kickstars
  # GET /kickstars.json
  def index
    @kickstars = Kickstar.all
  end

  # GET /kickstars/1
  # GET /kickstars/1.json
  def show
  end

  # GET /kickstars/new
  def new
    @kickstar = Kickstar.new
  end

  # GET /kickstars/1/edit
  def edit
  end

  # POST /kickstars
  # POST /kickstars.json
  def create
    @kickstar = Kickstar.new(kickstar_params)

    respond_to do |format|
      if @kickstar.save
        format.html { redirect_to @kickstar, notice: 'Kickstar was successfully created.' }
        format.json { render :show, status: :created, location: @kickstar }
      else
        format.html { render :new }
        format.json { render json: @kickstar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kickstars/1
  # PATCH/PUT /kickstars/1.json
  def update
    respond_to do |format|
      if @kickstar.update(kickstar_params)
        format.html { redirect_to @kickstar, notice: 'Kickstar was successfully updated.' }
        format.json { render :show, status: :ok, location: @kickstar }
      else
        format.html { render :edit }
        format.json { render json: @kickstar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kickstars/1
  # DELETE /kickstars/1.json
  def destroy
    @kickstar.destroy
    respond_to do |format|
      format.html { redirect_to kickstars_url, notice: 'Kickstar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kickstar
      @kickstar = Kickstar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kickstar_params
      params.require(:kickstar).permit(:coaches_crew_id, :crew_id, :start_time, :end_time)
    end
end
