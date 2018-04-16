class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protected

  
  before_action :set_locale

  protected

  def set_locale
    # I18n.default_locale = :en
    if current_user.nil?
      I18n.locale = I18n.default_locale
    else
      I18n.locale = current_user.locale.to_s || I18n.default_locale
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:locale])
    devise_parameter_sanitizer.permit(:account_update, keys: [:locale])
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email]
  end
end
