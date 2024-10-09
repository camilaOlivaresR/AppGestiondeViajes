json.extract! itinerary, :id, :name, :description, :star_date, :end_date, :user_id, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
