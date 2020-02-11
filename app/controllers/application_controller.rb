class ApplicationController < ActionController::Base

    before_action :set_locale

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || user_path(resource)
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end  
    
end
