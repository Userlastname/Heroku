class UsersController < ApplicationController
  def profile
    @patient = current_user
    @appointments = @patient.appointments.includes(:doctor)
  end
end
