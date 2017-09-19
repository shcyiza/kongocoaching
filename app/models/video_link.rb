class VideoLink < Multimedia
  belongs_to :watchable, polymorphic: true, optional: true


  def get_watchable_default #instance methode unlike get_default
    self.watchable.video_links.get_default
  end

  def set_as_default
    self.watchable.video_links.update_all(is_default: false)
    self.update(is_default: true)
  end

  def yt_id
    youtube_id = ""
    if self.video_path[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      self.video_path[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    return youtube_id
  end

  def yt_embed_link
    return "http://www.youtube.com/embed/#{ self.yt_id }"
  end

  def yt_thumbnail
    return "https://img.youtube.com/vi/#{ self.yt_id }/0.jpg"
  end

end
