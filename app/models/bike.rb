class Bike < ApplicationRecord
  belongs_to :user

  validates :brand, inclusion: { in: %w(honda fantic ktm yamaha suzuki cyberquad) }
end
