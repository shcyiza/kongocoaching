class VideoLink < ApplicationRecord
  belongs_to :watchable, polymorphic: true, optional: true

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
