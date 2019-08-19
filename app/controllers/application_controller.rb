class ApplicationController < ActionController::Base
  helper_method :notification

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
end
