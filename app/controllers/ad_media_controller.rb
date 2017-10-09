class AdMediaController < ApplicationController
  before_action :set_ad_medium, only: [:show, :edit, :update, :destroy]

  # GET /ad_media
  # GET /ad_media.json
  def index
    @ad_media = AdMedium.all
  end

  # GET /ad_media/1
  # GET /ad_media/1.json
  def show
  end

  # GET /ad_media/new
  def new
    @ad_medium = AdMedium.new
  end

  # GET /ad_media/1/edit
  def edit
  end

  # POST /ad_media
  # POST /ad_media.json
  def create
    @ad_medium = AdMedium.new(ad_medium_params)

    respond_to do |format|
      if @ad_medium.save
        format.html { redirect_to @ad_medium, notice: 'Ad medium was successfully created.' }
        format.json { render :show, status: :created, location: @ad_medium }
      else
        format.html { render :new }
        format.json { render json: @ad_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_media/1
  # PATCH/PUT /ad_media/1.json
  def update
    respond_to do |format|
      if @ad_medium.update(ad_medium_params)
        format.html { redirect_to @ad_medium, notice: 'Ad medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_medium }
      else
        format.html { render :edit }
        format.json { render json: @ad_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_media/1
  # DELETE /ad_media/1.json
  def destroy
    @ad_medium.destroy
    respond_to do |format|
      format.html { redirect_to ad_media_url, notice: 'Ad medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_medium
      @ad_medium = AdMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_medium_params
      params.require(:ad_medium).permit(:name, :ad_categories_id, :advertisable_id, :advertisable_type)
    end
end
