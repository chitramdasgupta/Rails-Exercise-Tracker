class Exercise < ApplicationRecord
  belongs_to :user

  paginates_per 5

  validates :name, presence: true
  validates :calories, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
