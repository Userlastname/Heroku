class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctors = Doctor.all
  end

  def create
    doctor = Doctor.find(appointment_params[:doctor_id])
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def appointment_params
    params.permit(:doctor_id, :user_id, :recommendation)
  end

  def appointment_time_options
    ['8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00']
  end
end
