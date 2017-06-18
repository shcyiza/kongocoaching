class ProfileVariablesController < ApplicationController
  before_action :set_profile_variable, only: [:show, :edit, :update, :destroy]

  # GET /profile_variables
  # GET /profile_variables.json
  def index
    @profile_variables = ProfileVariable.all
  end

  # GET /profile_variables/1
  # GET /profile_variables/1.json
  def show
  end

  # GET /profile_variables/new
  def new
    @profile_variable = ProfileVariable.new
  end

  # GET /profile_variables/1/edit
  def edit
  end

  # POST /profile_variables
  # POST /profile_variables.json
  def create
    @profile_variable = ProfileVariable.new(profile_variable_params)

    respond_to do |format|
      if @profile_variable.save
        format.html { redirect_to @profile_variable, notice: 'Profile variable was successfully created.' }
        format.json { render :show, status: :created, location: @profile_variable }
      else
        format.html { render :new }
        format.json { render json: @profile_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_variables/1
  # PATCH/PUT /profile_variables/1.json
  def update
    respond_to do |format|
      if @profile_variable.update(profile_variable_params)
        format.html { redirect_to @profile_variable, notice: 'Profile variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_variable }
      else
        format.html { render :edit }
        format.json { render json: @profile_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_variables/1
  # DELETE /profile_variables/1.json
  def destroy
    @profile_variable.destroy
    respond_to do |format|
      format.html { redirect_to profile_variables_url, notice: 'Profile variable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_variable
      @profile_variable = ProfileVariable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_variable_params
      params.require(:profile_variable).permit(:profile_id, :name, :variable)
    end
end
