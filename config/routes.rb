Rails.application.routes.draw do
  devise_for :users
	resources :games
	root 'games#index'
	post 'game/:id' => 'games#create_tweet',  as: 'create_tweet'
	get 'twittes' => 'games#get_twittes',  as: 'get_twittes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
