class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, :only => [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || home_path
  end

  # def after_sign_out_path_for(resource)
  #   	request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # 	end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :email, :password, :city, :country, :jobtitle, :jobrole) }
    end


    
end
