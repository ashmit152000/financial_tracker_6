class UserStocksController < ApplicationController
	def create
		user_id = params[:user]
		stock = Stock.find_by(ticker: params[:ticker])


		if !stock
			
			stock = Stock.new_lookup(params[:ticker])
			stock.save
		end

		if !only_ten?


		

			@user_stock = UserStock.create(user_id: user_id, stock_id: stock.id)
			flash[:notice] = "Added #{stock.name} to your portfolio"
			redirect_to my_portfolio_path
			
		end



	end


	def destroy
		stock = Stock.find_by(id: params[:id])
		@userstock = UserStock.where(user_id: current_user.id,stock_id: stock.id).first
		if @userstock 
			@userstock.destroy
			flash[:notice] = "#{stock.name} has been removed from your portfolio"
			redirect_to my_portfolio_path

		

		end
	end
end
