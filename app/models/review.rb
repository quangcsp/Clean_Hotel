## float    "rate"
#  integer  "hotel_id"
#  integer  "user_id"

class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
end
