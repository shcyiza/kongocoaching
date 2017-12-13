json.service_id srvc.id
json.name srvc.name
json.description truncate_html(srvc.description, length: 150, omission: "")
json.imgages do
  img = srvc.avatars.where(is_default: true).first
  if img != nil
    json.img_id img.id
    json.url img.photo.url
    json.vignette img.vignette
  end
end
