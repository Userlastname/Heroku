class Doctor < ApplicationRecord
  MAX_APPOINTMENT_COUNT = 10
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  belongs_to :category
  validates :phone, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\d{10}\z/, message: "should be a 10-digit number" }
  scope :ordered, -> { order(:first_name) }
end
