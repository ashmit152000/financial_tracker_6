class FriendshipsController < ApplicationController

def destroy
	friend = User.find_by(id: params[:id])
    friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    friendship.destroy
    flash[:notice] = "You unfriend #{friend.first_name + " " + friend.last_name}"
    redirect_to my_friends_path
end

end