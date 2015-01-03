class CommentsController < ApplicationController
  def create
    @comment = Comment.new
  end

  def destroy
    @comm
  end

  private

  def post_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
