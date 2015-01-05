class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]
  def create
    post = Post.find(params[:post_id])
    upvote = current_user.upvotes.build(post: post)

    respond_to do |format|
      if upvote.save
        upvote_count = post.upvotes.count
        format.html { redirect_to :back, notice: "You have upvoted!" }
        format.json { render json: {upvote: upvote, count: upvote_count } }
      else
        format.html { redirect_to :back }
        format.json { render json: upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.upvotes.destroy(params[:id])

    respond_to do |format|
      # Respond the same way we were before if the request format is html
      format.html do
        flash[:notice] = "All evidence of your upvote has been destroyed!"
        redirect_to :back
      end

      # Respond with a "204 No Content" to signify that the request has been
      # fulfilled
      upvote_count = post.upvotes.count
      format.json { render json: {post: post, count: upvote_count} }
    end
  end
end


