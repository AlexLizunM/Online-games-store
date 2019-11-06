class User < ApplicationRecord
  before_create :set_default_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :avatar
  has_many :bucket_items
  has_many :games, through: :bucket_items
  has_many :comments
  validates :nickname, presence: true, length: { maximum: 32 }, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def set_default_avatar
    self.avatar.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  end
end
