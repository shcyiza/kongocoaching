class TrainingTypesController < ApplicationController
  before_action :set_training_type, only: [:show, :edit, :update, :destroy]

  # GET /training_types
  # GET /training_types.json
  def index
    @training_types = TrainingType.all
  end

  # GET /training_types/1
  # GET /training_types/1.json
  def show
  end

  # GET /training_types/new
  def new
    @training_type = TrainingType.new
  end

  # GET /training_types/1/edit
  def edit
  end

  # POST /training_types
  # POST /training_types.json
  def create
    @training_type = TrainingType.new(training_type_params)
    respond_to do |format|
      if @training_type.save
        add_avatar params[:avatar][:photo], @training_type
        add_videolink params[:video_links][:video_path], @training_type
        format.html { redirect_to @training_type, notice: 'Training type was successfully created.' }
        format.json { render :show, status: :created, location: @training_type }
      else
        format.html { render :new }
        format.json { render json: @training_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_types/1
  # PATCH/PUT /training_types/1.json
  def update
    respond_to do |format|
      if @training_type.update(training_type_params)
        format.html { redirect_to @training_type, notice: 'Training type was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_type }
      else
        format.html { render :edit }
        format.json { render json: @training_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_types/1
  # DELETE /training_types/1.json
  def destroy
    @training_type.destroy
    respond_to do |format|
      format.html { redirect_to training_types_path, notice: 'Training type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_type
      @training_type = TrainingType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_type_params
      params.require(:training_type).permit(:name, :description, :duration_hours, :duration_minutes)
    end
end
