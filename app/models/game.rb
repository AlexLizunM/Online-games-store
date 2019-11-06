class Game < ApplicationRecord

  has_one_attached :cover
  has_many_attached :screenshots
  has_many :comments
  has_many :users, through: :comments
  validates :name, presence: true, length: { maximum: 128 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 500 }
  ransacker :price_money, formatter: proc { |dollars| dollars.to_i * 100 } do |p|
    p.table[:price]
  end
end
