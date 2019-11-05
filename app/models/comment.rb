class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :rating, presence: true, inclusion: 1..5
  validates :game_id, uniqueness: { scope: :user_id }
end
