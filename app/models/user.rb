class User < ApplicationRecord
  require 'digest/sha1'
  has_many :photos
  has_many :comments

  validates :first_name, :last_name, :login, :password_digest, :salt, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_password_digest(password, salt)
    Digest::SHA1.hexdigest "#{password}#{salt}"
  end

  def password_valid?(password)
    password_digest == generate_password_digest(password, salt)
  end
end
