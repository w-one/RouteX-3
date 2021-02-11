class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password, :remember_me])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :nickname, :email, :profile, :profile_image, :remove_profile_image, :twitter, :facebook, :instagram])
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: [:username, :nickname, :email, :profile, :profile_image, :remove_profile_image, :twitter, :facebook, :instagram]
  end


end
