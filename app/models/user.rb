class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password

  has_many :sessions, dependent: :destroy

  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, on: [:create]

  before_save { self.email = email.downcase if self.email.present? }

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def share_url
    if Rails.env.production?
      "https://morning-river-46142.herokuapp.com/share/#{id}"
    else
      "http://localhost:3000/share/#{id}"
    end
  end
end
