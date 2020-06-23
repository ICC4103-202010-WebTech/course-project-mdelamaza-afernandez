class ApplicationController < ActionController::Base
  # before_action :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?


  def set_user
     @current_user = current_user
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :location ])
  end
end