class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = current_user.friends
  end

  def destroy
    current_user.friends.destroy(@friend)
    flash[:success] = "Removed friend"
    redirect_to current_user
  end

  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end
end
