class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :brand, inclusion: { in: %w(honda fantic ktm yamaha suzuki cyberquad) }
  validates :user, presence: true
  validates :price, presence: true
  validates_numericality_of :price
end
