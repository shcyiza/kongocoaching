
json.services @services do |srvc|
  #svrc like service, did this to avoid conflic with another variable rails might have.
  json.partial! "api/v1/storefront/shared/service_instance.json", srvc: srvc
end
