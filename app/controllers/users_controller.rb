class UsersController < ApplicationController
  before_action :set_user, only: [:show, :add_friend]

  def show
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def add_friend
    if current_user.friend_request(@user)
      redirect_to users_path, notice: "Friend request successfully sent."
    else
      redirect_to users_path, notice: "There was an error sending the friend request"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
