class User < ApplicationRecord
  require 'digest/sha1'
  has_many :photos
  has_many :comments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_password_digest(password, salt)
    Digest::SHA1.hexdigest "#{password}#{salt}"
  end
end
