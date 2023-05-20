class User < ApplicationRecord
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

    # use this instead of email_changed? for rails >= 5.1
    def will_save_change_to_email?
      false
    end
end
