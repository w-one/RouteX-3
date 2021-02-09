class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :nickname, :email, :profile, :profile_image, :remove_profile_image, :twitter, :facebook, :instagram])
  end
end
