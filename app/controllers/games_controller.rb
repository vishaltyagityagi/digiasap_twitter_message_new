class GamesController < ApplicationController
	before_action :game_type, only: [:create_tweet]
	def index
		
		@tweets = Tweet.all.order('ID DESC')

		# @games = Game.all
	end
	# def create_tweet
	# 	@game_id.tweets.create!(message: params[:tweet][:message])
	# 	redirect_to root_path
	# end

	def get_twittes
		@client ||= Twitter::REST::Client.new do |config|
		config.consumer_key        = "use your key"
		config.consumer_secret     = "use"
		config.access_token        = "929731111697104896-dD3YwJsgkfSuHGkQ4i5ZABqIAhuu89z"
		config.access_token_secret = "vIy4z6c3YrMtJD9PlEBZJoBS9wkNtsbjnhOR4VHBkhXtO"
		end

		tweets = @client.user_timeline('cricket', count: 200)
		tweets.each do |t|
			Tweet.create(message: t.full_text) 
		end
		redirect_to root_path


	end

	# private
	# def game_type
	# 	@game_id = Game.find(params[:id]) rescue ""
	# end

	def permit_params
		params.require(:game).permit!
	end
end

