class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :posts, dependent: :destroy

  before_save {self.email.downcase!}
  before_create :remember_me


  validates :name,presence: true,uniqueness: true, length: {minimum: 6}
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: REGEX_EMAIL }
  has_secure_password
  #validates :password,presence: true, length: {minimum: 6}



  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token)
  end


  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest,User.digest(remember_token)) 
  end

  

  private
  
  def remember_me
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
  
end
