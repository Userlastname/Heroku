class Category < ApplicationRecord
  has_many :doctors
  validates :name, uniqueness: true

  scope :ordered, -> { order(name: :desc) }
end
