## float    "rate_avg"
#  string   "title"
#  text     "content"
#  string   "image"
#  integer  "hotel_id"
#  integer  "user_id"

class HotelRate < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

end
