class Booking < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :professional
  belongs_to :user
  enum booking_status: {pending: 0, confirmed: 1, declined: 2}
  validates :start_book, presence: true
  validates :end_book, presence: true
  validates :intro_message, presence: true
  has_many :reviews, dependent: :destroy
end
