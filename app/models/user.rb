require 'securerandom'

class User < ApplicationRecord
  before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :authentications, dependent: :destroy
  has_many :photos, dependent: :destroy


  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash.extra.raw_info.name,
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.urlsafe_base64
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end
end
