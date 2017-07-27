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

  def youtube_embed(youtube_url)
  if youtube_url[/youtu\.be\/([^\?]*)/]
    youtube_id = $1
  else
    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
    youtube_id = $5
  end

    raw(%Q{<iframe title="YouTube video player" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>})
  end

end
