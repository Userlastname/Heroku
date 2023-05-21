class ApplicationController < ActionController::Base
  before_action :authenticate_user_or_doctor!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def authenticate_user_or_doctor!
    if doctor_signed_in?
      authenticate_doctor!
    else
      authenticate_user!
    end
  end
end
