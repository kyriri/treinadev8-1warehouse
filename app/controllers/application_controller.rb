class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    if params[:locale].nil?
      locale = I18n.default_locale
    else
      locale = params[:locale].match(/[a-zA-Z]{2}/).to_s.to_sym
      if I18n.available_locales.exclude?(locale)
        locale = :en
        flash[:notice] = 'Unsuported language. You were directed to the English version.'
      end
      # locale = I18n.available_locales.include?(locale) ?
      #         locale : 
      #         I18n.default_locale
    end
    # locale = current_user.try(:locale) || I18n.default_locale # persists choice for logged users
    I18n.with_locale(locale, &action)
  end
end