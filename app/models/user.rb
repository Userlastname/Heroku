class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy
  validates :phone, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      def email_required?
      false
    end

    def email_changed?
      false
    end

    def will_save_change_to_email?
      false
    end
end
