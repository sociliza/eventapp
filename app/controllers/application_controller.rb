class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_parameters, if: :devise_controller?


  protected
  # redirect user after login
  def after_sign_up_path_for(resource)
    unless current_user.profile.present?
      edit_user_profiles_path(current_user)
    else
      flash[:alert] = "Please complete your profile"
      edit_user_profile_path(current_user)
    end
  end

  # redirect after logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def configure_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :name, :plan_id, :active])
  end
end
