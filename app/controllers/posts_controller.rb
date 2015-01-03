class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Your post have been successfully updated"
      redirect_to post_path(@post)
    else
      flash[:notice] = "There were errors in your submission"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy

    flash[:notice] = "#{@post.product_name} has been deleted"
    redirect_to profile_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:product_name, :url, :tagline).merge(user: current_user)
  end
end


