class Recommendation < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :content, presence: true
end
