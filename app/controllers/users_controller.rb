class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only:[ :show ]

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
    respond_to do |format|
      format.html
      format.json {render json: @friends}
    end
  end

  def show
    @user = User.find_by(id: params[:id])

     respond_to do |format|
      format.html
      format.json {render json: @user}
     end
    
     
    

  end
end
