class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/403'
      end

	  protect_from_forgery with: :exception
	  before_action :set_locale

	  private

	  def set_locale
	    I18n.locale = "fr"
	  end

end
