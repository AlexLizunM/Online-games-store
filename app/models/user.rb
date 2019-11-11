class User < ApplicationRecord
  before_create :set_default_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook]
  has_one_attached :avatar
  has_many :bucket_items, dependent: :destroy
  has_many :games, through: :bucket_items
  has_many :comments, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 32 }, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def set_default_avatar
    self.avatar.attach(io: File.open('db/picture_for_seed/duke.jpg'), filename: 'duke.jpg')
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
      user.confirmed_at = Time.now
    end
  end
end
