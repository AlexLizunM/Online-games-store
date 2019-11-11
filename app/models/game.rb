class Game < ApplicationRecord

  has_one_attached :cover
  has_many_attached :screenshots
  has_many :comments
  has_many :users, through: :comments
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings, allow_destroy: true
  validates :name, presence: true, length: { maximum: 128 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 500 }
  ransacker :price_money, formatter: proc { |dollars| dollars.to_i * 100 } do |p|
    p.table[:price]
  end

  def self.tagged_with(name)
    if name.present?
      Tag.find_by_name!(name).games
    else
      Game.all
    end
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end
end
