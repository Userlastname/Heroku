class Category < ApplicationRecord
  has_many :doctors, dependent: :destroy
  validates :name, uniqueness: true

  scope :ordered, -> { order(:name) }
end
