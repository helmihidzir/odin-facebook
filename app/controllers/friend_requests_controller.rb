class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)
    if @friend_request.save
      redirect_to users_path, notice: "Successfully sent friend request!"
    else
      redirect_to users_path
      flash[:error] = @friend_request.errors.full_messages.to_sentence
    end
  end

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def show
  end

  def destroy
    @friend_request.destroy
    flash[:success] = "Ignored friend request"
    redirect_to @friend_request
  end

  def update
    @friend_request.accept
    flash[:success] = "Accepted friend request"
    redirect_to @friend_request
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
