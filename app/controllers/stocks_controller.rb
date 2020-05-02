class StocksController < ApplicationController
  def search
  	# @stocks = params[:stock]
  	# byebug

  	if params[:stock].present?
	 
			@stock = Stock.new_lookup(params[:stock])
  			

  		if @stock
        respond_to do |format|
            format.js {render partial: 'users/result'}
            format.json { render json: @stock }
        end
  			
  		else
			 respond_to do |format|
          flash.now[:alert] ="Please enter a valid symbol to search"
          format.js{render partial: 'users/result'}
          format.json {render json: "Please enter a valid symbol" }
       end
	
			
			
		end

	
  else
  	respond_to do |format|
          flash.now[:alert] ="Please enter a symbol to search"
          format.js{render partial: 'users/result'}
          format.json {render json: "Please enter a symbol to search" }
       end
  end

  end


  def friend
    @friend = User.find_by(email: params[:friend])
    if @friend
      respond_to do |format|
            format.json {render json: @friend}  
            format.js {render partial: 'users/friend'}
             
        end

    else 
        respond_to do |format|
         flash.now[:alert] ="This user doesn't exist"
          format.json {render json: @friend}
          format.js {render partial: 'users/friend'}

      end

    end

  end
end
