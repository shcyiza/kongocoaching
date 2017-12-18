json.service_id srvc.id
json.name srvc.name
json.description truncate_html(srvc.description, length: 150, omission: "")

img = srvc.default_avatar
if img != nil
  json.default_picture img.photo.url
end
