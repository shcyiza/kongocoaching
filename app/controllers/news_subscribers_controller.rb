class NewsSubscribersController < ApplicationController
  before_action :set_news_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /news_subscribers
  # GET /news_subscribers.json
  def index
    @news_subscribers = NewsSubscriber.all
  end

  # GET /news_subscribers/1
  # GET /news_subscribers/1.json
  def show
  end

  # GET /news_subscribers/new
  def new
    @news_subscriber = NewsSubscriber.new
  end

  # GET /news_subscribers/1/edit
  def edit
  end

  # POST /news_subscribers
  # POST /news_subscribers.json
  def create
    @news_subscriber = NewsSubscriber.new(news_subscriber_params)

    respond_to do |format|
      if @news_subscriber.save
        format.html { redirect_back fallback_location: root_path, notice: 'Vous êtes inscrit à notre news letter, merci!' }
        format.json { render :show, status: :created, location: @news_subscriber }
      else
        format.html { render :new }
        format.json { render json: @news_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_subscribers/1
  # DELETE /news_subscribers/1.json
  def destroy
    @news_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to news_subscribers_url, notice: 'News subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_subscriber
      @news_subscriber = NewsSubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_subscriber_params
      params.require(:news_subscriber).permit(:email, :crew_id)
    end
end
