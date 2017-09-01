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

end
