class Category < ApplicationRecord
  has_many :careers, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true

  include PgSearch::Model
  multisearchable against: [ :title ]
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
