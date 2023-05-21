require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  describe "POST /appointments" do
    it "creates a new appointment" do
      doctor = FactoryBot.create(:doctor)
      user = FactoryBot.create(:user)

      appointment_params = {
        doctor_id: doctor.id,
        user_id: user.id,
        appointment_time: "10:00"
      }

      post appointments_path, params: { appointment: appointment_params }


      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)

      appointment = Appointment.last
      expect(appointment).not_to be_nil
      expect(appointment.doctor).to eq(doctor)
      expect(appointment.user).to eq(user)
      expect(appointment.recommendation).to eq("Some recommendation")
      expect(appointment.appointment_time).to eq("10:00")
    end
  end
end
