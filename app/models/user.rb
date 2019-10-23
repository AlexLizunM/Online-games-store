class User < ApplicationRecord
  has_one_attached :avatar
  validates :nickname, presence: true, length: { maximum: 32 }, uniqueness: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true
end
