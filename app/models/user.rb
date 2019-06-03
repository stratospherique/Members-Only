class User < ApplicationRecord
  before_save {self.email.downcase!}
  
  validates :name,presence: true,uniqueness: true, length: {minimum: 6}
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: REGEX_EMAIL }
  has_secure_password
  #validates :password,presence: true, length: {minimum: 6}
end
