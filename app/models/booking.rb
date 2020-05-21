class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :price, presence: true
end
