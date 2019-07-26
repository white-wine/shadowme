class Professional < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  belongs_to :career
  belongs_to :user

  include PgSearch::Model
  multisearchable against: [ :specialty ]

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).to_i
    else
      0
    end
  end
end
