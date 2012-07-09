class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_path
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to root_path
    end
  end
def all_friends


@friends=User.find(current_user.friendships.map(&:friend_id))
end



  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to root_path
  end
end
































