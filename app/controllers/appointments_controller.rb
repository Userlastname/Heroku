class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctors = Doctor.all
  end

  def create
    doctor = Doctor.find(appointment_params[:doctor_id])
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:success] = 'An appointment with the doctor was made successfully'
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  private

  def appointment_params
    params.permit(:doctor_id, :user_id, :recommendation, :appointment_time)
  end
end
