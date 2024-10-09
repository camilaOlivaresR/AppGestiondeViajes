json.extract! recommendation, :id, :content, :category, :itinerary_id, :user_id, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
