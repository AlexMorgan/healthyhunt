class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def show
    @user = current_user
  end

  private

  def authenticate_user
    if !current_user
      flash[:notice] = "You muse be signed in to view profile"
      redirect_to new_user_session_path
    end
  end
end
