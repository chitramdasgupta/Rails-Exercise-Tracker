class Exercise < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :calories, presence: true, numericality: { greater_than: 0 }
end
