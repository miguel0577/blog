# frozen_string_literal: true

# articles help module
module ArticlesHelper
  def current_user_owner_article?
    if user_signed_in? && (@article.owner == current_user.id)
      return true
    end
  end
  
  def current_user_owner_comment? comment_owner
    if user_signed_in? && (comment_owner == current_user.email)
      return true 
    end
  end
  
  def is_current_user_follower?
    @user.followers.find_by(follower: current_user).present?
  end
end
