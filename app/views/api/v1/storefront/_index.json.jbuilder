json.storefront_home do
  json.crew_name @crew.name
  json.coordinator do
    json.name @crew.owner.name
  end

  json.club  do
    club = @crew.club
    json.name club.name
    json.address club.address
  end

  json.services @crew.training_types.take(5) do |srvc|
    #svrc like service, did this to avoid conflic with another variable rails might have.
    json.partial! "api/v1/storefront/shared/service_instance.json", srvc: srvc
  end

  json.coaches @crew.coaches_crews.take(5) do |coach|
    json.partial! "api/v1/storefront/shared/coach_instance.json", coach: coach
  end

end
