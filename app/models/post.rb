class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 10, maximum: 20}
  validates :body, presence: true, length: {minimum: 20}
end
