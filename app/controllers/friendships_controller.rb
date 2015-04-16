
class FriendshipsController < ApplicationController

  def index
  end

  def create
    #@friendship = Friendship.new(friendship_params):followed_id => params[:followed_id]
    @friendship = current_user.friendships.create(:followed_id => params[:followed_id],:follower_id => params[:follower_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Error occurred when adding friend."
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