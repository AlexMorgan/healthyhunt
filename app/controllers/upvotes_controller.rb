class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]
  def create
    post = Post.find(params[:post_id])
    meow = current_user.upvotes.build(post: post)

    if meow.save
      redirect_to :back, notice: "You have upvoted!"
    else
      redirect_to :back
    end
  end

  def destroy
  end
end
