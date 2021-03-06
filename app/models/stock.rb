class Stock < ApplicationRecord

	has_many :user_stocks, dependent: :destroy
	has_many :users, through: :user_stocks

	validates_presence_of :name
	validates :name, presence: true


	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
  					publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
  					endpoint: 'https://sandbox.iexapis.com/v1'
				)

		begin
			new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol) )
		rescue => e 
				return nil
		end

		
	end
	


end
