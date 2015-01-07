class VotesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]
  def create
    @context = Vote.context(params)

    vote = @context.votes.new
    vote.user_id = current_user.id
    vote.save

    respond_to do |format|
      if vote.save
        upvote_count = @context.votes.count
        format.html { redirect_to :back, notice: "You have upvoted!" }
        format.json { render json: {upvote: vote, count: upvote_count } }
      else
        format.html { redirect_to :back }
        format.json { render json: vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @context = Vote.context(params)
    current_user.votes.destroy(params[:id])

    respond_to do |format|
      # Respond the same way we were before if the request format is html
      format.html do
        flash[:notice] = "All evidence of your upvote has been destroyed!"
        redirect_to :back
      end

      # Respond with a "204 No Content" to signify that the request has been
      # fulfilled
      upvote_count = @context.votes.count
      format.json { render json: {post: @context, count: upvote_count} }
    end
  end
end
