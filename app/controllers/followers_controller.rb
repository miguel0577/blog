class FollowersController < ApplicationController
  
  def create
    @user = User.find(follower_params[:user_id])
    @follower = @user.followers.create(follower_params)
    redirect_to root_path
  end

  def show
    @follower = Follower.find(params[:id])
  end
  
  def delete
    @follower = Follower.find(params[:id])
    @follower.destroy

    redirect_to root_path
  end

  private
    def follower_params
      params.require(:follower).permit(:id_follower, :user_id)
    end
end
