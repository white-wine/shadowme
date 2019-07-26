class Career < ApplicationRecord
  has_many :professionals, dependent: :destroy
  belongs_to :category
  validates :title, presence: true
  validates :title, uniqueness: true

  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
