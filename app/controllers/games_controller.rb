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


def get_all_tweets
	@client ||= Twitter::REST::Client.new do |config|
		config.consumer_key        = "AcDdxJser1b9PZKXO4nkmdAeT"
		config.consumer_secret     = "spDfoQ40iwcPWJbcy6TzXy0boYTLuuiwqWJ8MowQmKIzsRFg7s"
		config.access_token        = "929731111697104896-dD3YwJsgkfSuHGkQ4i5ZABqIAhuu89z"
		config.access_token_secret = "vIy4z6c3YrMtJD9PlEBZJoBS9wkNtsbjnhOR4VHBkhXtO"
		end
	#set max_id to max value
	mnid = 999999999999999999
	#set number of tweets you want to get 
	max_no_tweets = 2
	count = 0
	while(count < max_no_tweets)
		#each loop gets 200 tweet
		@client.user_timeline('sachin tendulkar', :count => 200, :max_id => mnid).each do |tweet|
			# Tweet.create(message: tweet.full_text) 
			        puts(tweet.text) if tweet.is_a?(Twitter::Tweet)

			# to get the next 200 tweet
			mnid = [mnid,tweet.id].min
			count+=1
		end
	end
		redirect_to root_path
	
end

	def get_twittes
		@client ||= Twitter::REST::Client.new do |config|
		config.consumer_key        = "AcDdxJser1b9PZKXO4nkmdAeT"
		config.consumer_secret     = "spDfoQ40iwcPWJbcy6TzXy0boYTLuuiwqWJ8MowQmKIzsRFg7s"
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

