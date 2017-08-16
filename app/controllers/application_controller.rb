class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :contact, :location, :latitude, :longitude, :role, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name, :contact, :location, :latitude, :longitude, :sched, :payment, :comments, :role])
  end
    
    helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
end
