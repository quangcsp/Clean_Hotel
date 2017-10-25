## float    "rate"
#  integer  "hotel_id"
#  integer  "user_id"

class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 10}
  validates :rate, presence: true, numericality: true
  validates :hotel_id, presence: true
  default_scope -> { order(created_at: :desc) }
end
