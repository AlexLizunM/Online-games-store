class Game < ApplicationRecord

  has_one_attached :cover
  validates :name, presence: true, length: {maximum: 128}
  validates :price, presence: true, numericality: {greater_than: 0}
end
