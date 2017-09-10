class FollowsController < ApplicationController
  def create
    follow = current_user.follows.create!(follow_params)
    @item = follow.follower
    respond_to do |f|
      f.html {redirect_back(fallback_location: root_path)}
      f.js {render "follow"}
    end
  end

  def destroy
    follower = User.find params[:user_id]
    current_user.followers.delete(follower)
    @item = follower
    respond_to do |f|
      f.html {redirect_back(fallback_location: root_path)}
      f.js {render "unfollow"}
    end
  end

  def follow_params
    params.require(:follow).permit(:follower_id)
  end
end
