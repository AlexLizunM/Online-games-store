class Game < ApplicationRecord

  has_one_attached :cover
  has_many_attached :screenshots
  validates :name, presence: true, length: { maximum: 128 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  ransacker :price_money, formatter: proc { |dollars| dollars.to_i * 100 } do |p|
    p.table[:price]
  end
end
