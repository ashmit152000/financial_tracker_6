class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :only_ten?, :already_added?, :already_friend?

	def only_ten?
		if current_user.stocks.count >= 10

			flash[:alert] = "You cannot track more than 10 stocks. Sorry"
			redirect_to my_portfolio_path

		
			

		end
	end


	def already_added?(ticker_symbol)
		if current_user.stocks.find_by(ticker: ticker_symbol)
				
				return true


		end

	end

	def already_friend?(friend)
		friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id)

		if friendship.first
			return true
		
		
		end
	end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name])
  end
end
