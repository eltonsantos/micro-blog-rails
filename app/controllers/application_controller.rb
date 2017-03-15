# Class ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_sign_in_path_for(resource)
      posts_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :image])
    end
end
