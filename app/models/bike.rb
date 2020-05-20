class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :brand, inclusion: { in: %w[Honda Fantic KTM Yamaha Suzuki Cyberquad] }
  validates :user, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, numericality: { only_integer: true }
end
