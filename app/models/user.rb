class User < ApplicationRecord
  has_many :exercises

  has_one_attached :profile_picture

  has_secure_password

  validates :email, presence: true, uniqueness: true
end
