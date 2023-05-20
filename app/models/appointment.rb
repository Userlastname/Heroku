class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  scope :opened, -> { where(recommendation: nil) }
end
