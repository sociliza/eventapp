class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_parameters, if: :devise_controller?

  def configure_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:company_name, :name, :plan_id, :active]
  end
end
