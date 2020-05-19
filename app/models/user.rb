class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes
  has_many :bookings
  # goes through bikes I have booked that belong to other people
  has_many :booked_bikes, through: :bookings, source: :bike
  # goes through my bikes which have been booked by other people
  has_many :bike_bookings, through: :bikes, source: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
end
