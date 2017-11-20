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


  def youtube_embed video, *style
    result = content_tag :iframe, 'youtube', src: video.yt_embed_link
    if style
      result = content_tag :iframe, 'youtube', src: video.yt_embed_link, style: style
    end
    return result
  end

  def tel_to text, html_options = {}
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to '<i class="icon-phone"></i>: '.html_safe + text, "tel:#{groups.join '-'}", html_options
  end

  def link_to_function(name, *args, &block)
   html_options = args.extract_options!.symbolize_keys

   function = block_given? ? update_page(&block) : args[0] || ''
   onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
   href = html_options[:href] || '#'

   content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end

  def video_bg_path asset_str
    path = asset_path(asset_str)
    bg_path = path.slice(0..(path.index('.'))).tr(".", "")
    return bg_path
  end

  def link_map_for(place, options = {})
    params = {
      center: [place.latitude, place.longitude].join(","),
      zoom: 17,
      size: "300x300",
      markers: [place.latitude, place.longitude].join(","),
      sensor: true,
      key: "AIzaSyAvb2OQWipY6XeXhNeHRSgFl5xT-_Z8_rg"
      }.merge(options)

    query_string_img =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    query_string_address = CGI::escape place.address
    link_to "https://www.google.be/maps/place/#{query_string_address}", target: "_blank" do
      image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string_img}", :alt => place.name
    end
  end

  def static_map_for(place, options = {})
    params = {
      center: [place.latitude, place.longitude].join(","),
      zoom: 17,
      size: "300x300",
      markers: [place.latitude, place.longitude].join(","),
      sensor: true,
      key: "AIzaSyAvb2OQWipY6XeXhNeHRSgFl5xT-_Z8_rg"
      }.merge(options)

    query_string_img =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    query_string_address = CGI::escape place.address
      image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string_img}", :alt => place.name
  end

  def link_to_gmaps(place, text)
    query_string = CGI::escape place.address
    link_to text, "https://www.google.be/maps/place/#{query_string}", target: "_blank"
  end

  def odinal_count instance, collection
    ordinal = collection.index(instance) + 1
    if collection.index(instance) == 0
      return "#{ordinal}er"
    else
      return "#{ordinal}ème"
    end
  end

  def weekdays_array
    [
      {id: 1, name: "lundi"},
      {id: 2, name: "mardi"},
      {id: 3, name: "mercreudi"},
      {id: 4, name: "jeudi"},
      {id: 5, name: "vendredi"},
      {id: 6, name: "samedi" },
      {id: 7, name: "dimanche"}
    ]
  end

  def day_periods_array
    [
      {id: 0, name: "n'importe quelle moment"},
      {id: 1, name: "matin (entre 8 et 11h)"},
      {id: 2, name: "midi (entre 11 et 14h)"},
      {id: 3, name: "après-midi (entre 14 et 17h)"},
      {id: 4, name: "soir (entre 17h et 20h)"},
    ]
  end

end
