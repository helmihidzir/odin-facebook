class ApplicationController < ActionController::Base
  helper_method :notification
  before_action :configure_permitted_parameters, if: :devise_controller?

  # to allow access to all pundit method
  include Pundit

  def notification
    @total_request = (FriendRequest.where(friend: current_user)).count
  end

  rescue_from Pundit::NotAuthorizedError, with: :current_user_not_authorized

  private

  def current_user_not_authorized
    flash[:alert] = 'You do are not authorized for this action.'
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
