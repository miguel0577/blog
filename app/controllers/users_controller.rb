class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @actual_user = current_user
    @rel = @user.followers.find_by(follower: current_user)
    @actual_current_user = true if @user.id == current_user.id
  end
end
