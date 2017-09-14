json.extract! news_subscriber, :id, :email, :crew_id, :created_at, :updated_at
json.url news_subscriber_url(news_subscriber, format: :json)
