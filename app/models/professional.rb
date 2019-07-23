class Professional < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :career
  belongs_to :user
end
