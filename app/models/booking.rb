class Booking < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :professional
  belongs_to :user

  validates :date, presence: true
  validates :intro_message, presence: true, length: { minimum: 20 }
end
