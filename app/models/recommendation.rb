class Recommendation < ApplicationRecord
  belongs_to :itinerary, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :content, presence: true
end
