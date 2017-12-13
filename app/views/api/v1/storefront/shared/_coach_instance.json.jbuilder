json.coach_id coach.id
json.name coach.get_name
json.images do
   img = coach.avatars.where(is_default: true).first
   if img != nil
     json.img_id img.id
     json.url img.photo.url
     json.vignette img.vignette
   end
end
json.specialties coach.specialties do |specialty|
  json.specialty_id specialty.id
  json.name specialty.name
end
