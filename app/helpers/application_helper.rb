module ApplicationHelper

  #----------------url helpers for kongo_coaching_pages controllers
  def set_kc_path(action)
    #DRY principle, I wrote this methods so i don't have to rewrite the first part all the other time
    url_for controller: 'kongo_coaching_pages', action: action
  end

  def kc_kistart_register_path
    set_kc_path('sign_up')
  end

  def kc_new_kickstart_path
    set_kc_path('new_kickstart')
  end

  #----------------END url helpers for kongo_coaching_pages controllers END

end
