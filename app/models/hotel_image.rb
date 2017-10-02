# string   "image"
# integer  "hotel_id"

class HotelImage < ApplicationRecord
  belongs_to :hotel

  validates :image, presence: true
end
