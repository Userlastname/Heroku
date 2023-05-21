module AppointmentsHelper
  def appointment_time_options(doctor_id)
    selected_appointment_times = doctor_selected_appointment_times(doctor_id)
    all_appointment_times = ['8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00']

    available_appointment_times = all_appointment_times - selected_appointment_times
    options_for_select(available_appointment_times)
  end

  def update_appointment_times(doctor_id, appointment_time)
    doctor = Doctor.find(doctor_id)
    doctor.appointments.create(appointment_time: appointment_time)

    selected_appointment_times = doctor_selected_appointment_times(doctor_id)
    selected_appointment_times << appointment_time
    doctor.update(appointment_times: selected_appointment_times.uniq)
  end

  def appointment_already_exists?(doctor_id, appointment_time)
    selected_appointment_times = doctor_selected_appointment_times(doctor_id)
    selected_appointment_times.include?(appointment_time)
  end

  private

  def doctor_selected_appointment_times(doctor_id)
    doctor = Doctor.find(doctor_id)
    appointments = doctor.appointments.where.not(appointment_time: nil)
    selected_appointment_times = appointments.pluck(:appointment_time)
    current_appointment_time = appointments.find_by(user_id: current_user.id)&.appointment_time

    selected_appointment_times -= [current_appointment_time] if current_appointment_time.present?

    selected_appointment_times
  end

end
