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
    #code
  end

  def services_index
    #code
  end

  def services_show
    #code
  end

  def coaches_index
    #code
  end

  def coaches_show
    #code
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

end
