json.extract! training, :id, :coach_id, :training_type_id, :start_time, :end_time, :created_at, :updated_at
json.url training_url(training, format: :json)
