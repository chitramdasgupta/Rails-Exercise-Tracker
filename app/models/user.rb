class User < ApplicationRecord
  has_many :exercises

  has_one_attached :profile_picture

  has_secure_password

  enum role: [:member, :trainer, :admin]

  validates :role, inclusion: { in: roles.keys }

  validates :email, presence: true, uniqueness: true
end
