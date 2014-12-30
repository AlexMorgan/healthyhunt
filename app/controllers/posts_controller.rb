class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been successfully added."
      redirect_to root_path
    else
      flash[:notice] = "There were errors in your submission"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:product_name, :url, :tagline).merge(user: current_user)
  end
end


