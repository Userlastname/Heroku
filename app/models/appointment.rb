class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user, class_name: 'User'
  scope :opened, -> { where(recommendation: nil) }
end
