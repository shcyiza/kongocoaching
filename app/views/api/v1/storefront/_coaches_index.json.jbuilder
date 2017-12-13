json.storefront_coaches_index do
  json.coaches @crew.coaches_crews do |coach|
    json.partial! "api/v1/storefront/shared/coach_instance.json", coach: coach
  end
end
