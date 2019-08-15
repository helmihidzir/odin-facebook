class ApplicationController < ActionController::Base
  helper_method :notification

  def notification
    @total_request = (FriendRequest.where(friend: current_user) + current_user.friend_requests).count
  end
end
