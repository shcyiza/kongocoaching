module CrewsHelper

  def all_kickstar_count
    Kickstart.all.count
  end

  def confirmed_kickstar_count
    Kickstart.all_confirmed.count
  end

  def unconfirmed_kickstar_count
    all_kickstar_count - confirmed_kickstar_count
  end
end
