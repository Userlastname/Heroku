require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:doctor).dependent(:destroy) }

    it { is_expected.to belong_to(:user).dependent(:destroy) }
  end

  describe "scopes" do
    describe ".opened" do
      it "returns appointments with empty recommendation field" do
        doctor = FactoryBot.create(:doctor)
        user = FactoryBot.create(:user, first_name: "John", last_name: "Doe", phone: "1234567890", password: "password")

        opened_appointment = FactoryBot.create(:appointment, doctor: doctor, user: user, recommendation: "")
        closed_appointment = FactoryBot.create(:appointment, doctor: doctor, user: user, recommendation: "Some recommendation")

        opened_appointments = Appointment.opened

        expect(opened_appointments).to include(opened_appointment)
        expect(opened_appointments).not_to include(closed_appointment)
      end
    end
  end
end
