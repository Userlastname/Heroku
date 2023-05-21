require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:users).through(:appointments) }

    it { is_expected.to have_many(:appointments).dependent(:destroy) }

    it { is_expected.to belong_to(:category) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:phone) }

    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }

    it { is_expected.to allow_value("1234567890").for(:phone) }

    it { is_expected.not_to allow_value("12345").for(:phone).with_message("should be a 10-digit number") }
  end

  describe "scopes" do
    describe ".ordered" do
      it "returns doctors ordered by category_id" do
        doctor_c = FactoryBot.create(:doctor, first_name: "Charlie")
        doctor_a = FactoryBot.create(:doctor, first_name: "Alice")
        doctor_b = FactoryBot.create(:doctor, first_name: "Bob")

        ordered_doctors = Doctor.ordered

        expect(ordered_doctors).to eq([doctor_a, doctor_b, doctor_c])
      end
    end
  end
end
