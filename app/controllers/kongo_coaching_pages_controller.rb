class KongoCoachingPagesController < ApplicationController
  before_action :set_crew
  before_action :authenticate_user!, only: [:new_kickstart, :add_motivation, :after_creation_actions]
  layout "kc_layout"

  def set_crew
    @crew = Crew.find(1)
    @clubs = @crew.clubs
    @club = @crew.club

  end

  def home
    @services = @crew.training_types.take(5)
    @coaches = @crew.coaches_crews.take(5)
    @subscriber = @crew.news_subscribers.build
  end

  def services_index
    @services = @crew.training_types
  end

  def services_show
    @service = TrainingType.find(params[:id])
    if @service.crew == @crew
    else
      redirect_back_wrong_way
    end
  end

  def coaches_index
    @coaches = @crew.coaches_crews.paginate( page: params[:page], per_page: 8 )
  end

  def coaches_show
    @coach = CoachesCrew.find(params[:id])
    if @coach.crew == @crew
    else
      redirect_back_wrong_way
    end
  end

  def contact
    #code
  end

  def about
    #code
  end

  def login
    #code
  end

  def new_kickstart
    @profile = current_user.profile
    @kickstart = current_user.his_crew_as_client.kickstarts.build
  end

  def edit_kickstart
    #code
  end

  def show_kickstart
    @kickstart = current_user.his_kickstart_as_client
  end

end
