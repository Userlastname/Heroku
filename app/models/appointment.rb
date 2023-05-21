class Appointment < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  belongs_to :user, dependent: :destroy

  scope :opened, -> { where(recommendation: [nil, ""]) }
end
