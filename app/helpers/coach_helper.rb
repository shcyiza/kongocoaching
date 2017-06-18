module CoachHelper

  def add_coach
    if current_user && current_user.coordinator?
      link_to 'New Coach', new_coach_path
    end
  end

end
