module MultimediaHelper

  def default_pic_link pic
    if pic.is_default?
      "<font color='#c4ac45'><i class='icon-star'></i></font>".html_safe
    else
      content_tag :a, href: "#",
      data:{toggle:"modal", target: "#default_picbox#{pic.id}", turbolinks: "false"},
      class:"trash", style:"color: green;" do
        "<i class='icon-star-empty'></i>".html_safe
      end
    end
  end

  def default_vid_link video
    if video.is_default?
      "<font color='#c4ac45'><i class='icon-star'></i></font>".html_safe
    else
      content_tag :a, href: "#",
      data:{toggle:"modal", target: "#default_videobox#{video.id}", turbolinks: "false"},
      class:"trash", style:"color: green;" do
        "<i class='icon-star-empty'></i>".html_safe
      end
    end
  end

  def new_videolink
    VideoLink.new
  end

  def new_avatar
    Avatar.new
  end

  def hide_if_empty_src avatar
    result = "hidden"
    if avatar && avatar.class.name == "Avatar"
      if avatar.photo
        result = ""
      end
    end
    return result
  end

  def show_editable_src avatar
    result = "#"
    if avatar && avatar.class.name == "Avatar"
      if avatar.photo
        result = avatar.photo.url
      end
    end
    return result
  end

  def has_photos_of attachable
    result = false
    if attachable.avatars.count > 0
      result = true
    end
    return result
  end

  def has_videos_of watchable
    result = false
    if watchable.video_links.count > 0
      result = true
    end
    return result
  end

  def count_videos_for watchable
    watchable.video_links.count
  end

  def count_avatars_for attachable
    attachable.avatars.count
  end

end
