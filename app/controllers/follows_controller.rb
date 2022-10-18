class FollowsController < ApplicationController

  def create
    other_user = User.find(params[:user_id])
    @rel = Follow.new(follower_id: current_user.id,
                      followed_id: other_user.id
                      )
    @rel.save
    redirect_to user_path(other_user)
  end  
  
  def destroy
    @rel = Follow.find(params[:format])
    @rel.destroy
    redirect_to user_path(@rel.followed_id)
  end
end
