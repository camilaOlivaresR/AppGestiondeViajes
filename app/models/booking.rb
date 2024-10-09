class Booking < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :detail, reservation_date,  presence: true
end
