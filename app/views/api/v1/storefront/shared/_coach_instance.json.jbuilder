json.coach_id coach.id
json.name coach.get_name
img = coach.default_avatar

if img != nil
 json.default_picture img.photo.url
end

json.specialties coach.specialties do |specialty|
  json.specialty_id specialty.id
  json.name specialty.name
end
