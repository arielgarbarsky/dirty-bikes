class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :brand, inclusion: { in: %w(honda fantic ktm yamaha suzuki cyberquad) }
  validates :user, presence: true
end
