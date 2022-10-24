module UsersHelper
  def actual_current_user?
    if @user.id == current_user.id
      return true
    end
  end

  def current_user_follower
    @user.followers.find_by(follower: current_user)
  end
end
