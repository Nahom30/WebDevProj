
class FriendshipsController < ApplicationController

  def index
  end

  def create
    user_to_follow = User.find(params[:followed_id])
    if current_user.following?(user_to_follow)
      flash[:alert] = "Already following this user."
      redirect_to root_url
    else
      current_user.follow(user_to_follow)
      flash[:notice] = "Yay! You have new friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_url
  end



end

private

def friendship_params
  params.require(:friendship).permit(:followed_id, :followed_id)
end