json.service @service
if @service.photo
  json.default_picture @service.photo
end
json.coaches @service.specialties do |specialty|
  coach = specialty.specializable
  json.coach_id coach.id
  json.name coach.name
  if coach.photo
    json.default_picture coach.photo
  end
end
json.gallery do
  json.photos @service.avatars do |img|
    json.photo_id img.id
    json.url img.photo.url
  end

  if has_videos_of @service
    json.videos @service.video_links do |video|
      json.video_id video.id
      json.video_path video.video_path
    end
  end
end
