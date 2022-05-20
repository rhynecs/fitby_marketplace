class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date, :phone_number, :bio, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_date, :phone_number, :bio, :avatar])
  end
end