class UsersController < ApplicationController
  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

  def add_friend
  	@friend = User.find_by(id: params[:id])

  	if @friend 
  		Friendship.create(user_id: current_user.id, friend_id: @friend.id)
  		flash[:notice] = "User added as your friend"
  		redirect_to my_portfolio_path
  	end
  end
end
