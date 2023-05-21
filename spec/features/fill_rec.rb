require 'rails_helper'

RSpec.feature "Doctor login and leave recommendation", type: :feature, js: true do
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  scenario "Doctor logs in and leaves recommendation for a patient" do
    doctor = FactoryBot.create(:doctor, phone: "0954481341", password: "password")
    user = FactoryBot.create(:user, first_name: "Paul", last_name: "Industrious")

    visit "/doctors/sign_in"

    fill_in "Phone", with: doctor.phone
    fill_in "Password", with: doctor.password

    click_button "Log in"

    appointment_params = {
      doctor_id: doctor.id,
      user_id: user.id,
    }

    appointment = FactoryBot.create(:appointment, appointment_params)

    visit "/doctors/#{doctor.id}/appointments"

    fill_in "Recommendation", with: "System test recommendation"
    click_button "Add Recommendation"

    expect(page).to have_content("Recommendation added successfully")
  end
end
