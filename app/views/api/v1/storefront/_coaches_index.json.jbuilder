json.storefront_coaches_index do
  json.coaches @coaches do |coach|
    json.partial! "api/v1/storefront/shared/coach_instance.json", coach: coach
  end
end
