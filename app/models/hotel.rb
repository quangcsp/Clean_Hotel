## schema infomation
# table : hotel
#
# name: string
# address: string
# avatar: string
# star: integer
# rate_avg: float
# desciption: string

class Hotel < ApplicationRecord
  has_many :hotel_images
  has_many :hotel_rates
  has_many :reviews
  validates :name, presence: true, length: {maximum: 20}
  validates :address, presence: true
  validates :desciption, presence: true
  validates :star, presence: true
end
