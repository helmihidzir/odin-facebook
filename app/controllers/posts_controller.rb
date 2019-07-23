class PostsController < ApplicationController
  def index
    @posts = Post.all
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

  private

  def post_params
    params.require(:post).permit(:description)
  end

end
