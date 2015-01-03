class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :delete]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
      flash[:notice] = "Your comment has been submitted"
    else
      flash[:notice] = "There were errors in your submission"
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({ user: current_user, post: @post })
  end
end
