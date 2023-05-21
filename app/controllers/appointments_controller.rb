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

  # def appointment_time_options
  #   selected_appointment_times = doctor_selected_appointment_times
  #   all_appointment_times = ['8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00']

  #   available_appointment_times = all_appointment_times - selected_appointment_times
  #   options_for_select(available_appointment_times)
  # end

  # def doctor_selected_appointment_times
  #   doctor = Doctor.find(appointment_params[:doctor_id])
  #   doctor.appointments.pluck(:appointment_time)
  # end
end
