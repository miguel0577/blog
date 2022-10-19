class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @actual_user = current_user
  end
end
