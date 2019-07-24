class Category < ApplicationRecord
  has_many :careers, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true

end
