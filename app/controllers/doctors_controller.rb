class DoctorsController < ApplicationController
  def index
    @doctors = collection
  end

  def show
    @doctor = resource
  end

  def update_recommendation
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.update(recommendation: params[:recommendation])
    flash[:success] = 'Recommendation added successfully'
    redirect_to request.referer
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
