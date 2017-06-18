json.extract! profile, :id, :user_id, :coaches_crew_id, :birth_date, :sex, :created_at, :updated_at
json.url profile_url(profile, format: :json)
