json.coach @coach
if @coach.photo
  json.default_picture @coach.photo
end
json.serices @coach.specialties do |specialty|
  srvc = specialty.training_type
  json.service_id srvc.id
  json.name srvc.name
  if srvc.photo
    json.default_picture srvc.photo
  end
end
json.gallery do
  json.photos @coach.avatars do |img|
    json.photo_id img.id
    json.url img.photo.url
  end

  if has_videos_of @coach
    json.videos @coach.video_links do |video|
      json.video_id video.id
      json.video_path video.video_path
    end
  end
end
