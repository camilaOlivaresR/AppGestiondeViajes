class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :recommendations, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, :description, presence: true
end
