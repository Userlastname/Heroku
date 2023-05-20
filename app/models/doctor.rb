class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  validates :specialty, presence: true, if: -> { doctor? }
  devise :database_authenticatable, :validatable

  def doctor?
    role == 'doctor'
  end
end
