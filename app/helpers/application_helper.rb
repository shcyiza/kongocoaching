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

end
