class DoctorsController < ApplicationController
  def index
    @doctors = collection
  end

  def show
    @doctor = resource
  end

  def update_recommendation
    @appointment = current_doctor.appointments.find(params[:appointment_id])
    @appointment.recommendation = params[:recommendation]
    @appointment.closed = true

    if @appointment.save
      redirect_to doctor_appointments_path, notice: 'Recommendation added and appointment closed.'
    else
      redirect_to doctor_appointments_path, alert: 'Failed to update recommendation.'
    end
  end



  def appointments
    @doctor = current_doctor # Assuming the doctor is logged in and stored in the current_user variable
    @appointments = @doctor.appointments.includes(:user)
  end

  private

  def collection
    Doctor.ordered
  end

  def resource
    collection.find(params[:id])
  end
end
