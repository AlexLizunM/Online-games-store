class Comment < ApplicationRecord
  after_create :set_average_ratio
  after_destroy :set_average_ratio

  belongs_to :user
  belongs_to :game
  validates :rating, presence: true, inclusion: 1..5
  validates :game_id, uniqueness: { scope: :user_id }

  def set_average_ratio
    game = self.game
    ratings = game.comments.pluck(:rating)
    game_rating = ratings.count > 0 ? ratings.reduce(:+) / ratings.count : 0
    game.update(average_rating: game_rating)
  end
end
