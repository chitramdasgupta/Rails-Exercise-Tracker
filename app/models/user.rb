class User < ApplicationRecord
  belongs_to :trainer, class_name: "User", optional: true
  has_many :members, class_name: "User", foreign_key: "trainer_id"

  has_many :exercises, dependent: :destroy

  has_one_attached :profile_picture

  has_secure_password

  enum role: [:member, :trainer, :admin]

  validates :role, inclusion: { in: roles.keys }

  validates :email, presence: true, uniqueness: true
end
