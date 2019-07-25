class Booking < ApplicationRecord
  has_many :reviews
  has_many :messages, dependent: :destroy
  belongs_to :professional
  belongs_to :user
  enum booking_status: {pending: 0, confirmed: 1, declined: 2}
  validates :date, presence: true
  validates :intro_message, presence: true, length: { minimum: 20 }
end
