class UsersController < ApplicationController
  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

  def add_friend
  	@friend = User.find_by(id: params[:id])

  	if @friend 
  		Friendship.create(user_id: current_user.id, friend_id: @friend.id)
  		flash[:notice] = "User added #{@friend.first_name.capitalize + " " + @friend.last_name.capitalize} as your friend"
  		redirect_to my_friends_path
  	end
  end

  def all_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find_by(id: params[:id])

  end
end
