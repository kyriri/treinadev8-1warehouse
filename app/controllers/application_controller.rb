class ApplicationController < ActionController::Base
  around_action :switch_locale

def switch_locale(&action)
  locale = params[:locale] || I18n.default_locale
  # locale = current_user.try(:locale) || I18n.default_locale # persists choice for logged users
  I18n.with_locale(locale, &action)
end

end
