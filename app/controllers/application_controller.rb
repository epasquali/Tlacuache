class ApplicationController < ActionController::Base

    around_action :switch_locale
    #before_action :set_locale
    prepend_before_action :set_locale

    #Devise redirect route overrides
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || user_path(resource)
    end

    def after_confirmation_path_for(resource)
      sign_in(resource)
      stored_location_for(resource) || user_path(resource)
    end

    #Localization
    def default_url_options
      { locale: I18n.locale }
    end

    def switch_locale(&action)
      locale = params[:locale] || I18n.default_locale
      I18n.with_locale(locale, &action)
      #I18n.locale=locale
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end  
    
end
