class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :liked, :unliked]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Successfully created a new Post!"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  def liked
    @post.liked_by current_user
    redirect_back(fallback_location:"/")
  end

  def unliked
    @post.unliked_by current_user
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
