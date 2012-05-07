class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale, :authenticate_user!

  def set_locale
    locales = %w(es-AR en-US pt-BR)
    I18n.locale = request.compatible_language_from(locales)
  end

end
