json.extract! booking, :id, :detail, :reservation_date, :itinerary_id, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
