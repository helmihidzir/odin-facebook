class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :liked, :unliked]
  before_action :authenticate_user!, except: [:show]

  after_action :verify_authorized, except: [:index, :show]

  def index
    # @posts = Post.all.order("created_at DESC")
    friend_ids = "SELECT user_id FROM friendships WHERE  friend_id = :user_id"
    @posts = Post.where("user_id IN (#{friend_ids}) OR user_id = :user_id", user_id: current_user.id).all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post
    if @post.save
      redirect_to root_path, notice: "Successfully created a new Post!"
    else
      puts @post.errors.full_messages
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  def liked
    @post.liked_by current_user
    authorize @post
    redirect_back(fallback_location:"/")
  end

  def unliked
    @post.unliked_by current_user
    authorize @post
    redirect_back(fallback_location:"/")
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
