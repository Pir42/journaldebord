class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
			redirect_to '/403'
		end

	  protect_from_forgery with: :exception
	  before_action :set_locale
	  add_breadcrumb "Modifier mon compte", :edit_user_registration_path

	  private

	  def set_locale
	    I18n.locale = "fr"
		end

		before_action :configure_permitted_parameters, if: :devise_controller?
		protected
		def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
		end
end
