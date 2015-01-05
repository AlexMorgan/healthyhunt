class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]
  def create
    post = Post.find(params[:post_id])
    upvote = current_user.upvotes.build(post: post)

    respond_to do |format|
      if upvote.save
        format.html { redirect_to :back, notice: "You have upvoted!" }
        format.json { render json: upvote }
      else
        format.html { redirect_to :back }
        format.json { render json: upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.upvotes.destroy(params[:id])

    flash[:notice] = "All evidence of your upvote has been destroyed!"
    redirect_to :back
  end
end


