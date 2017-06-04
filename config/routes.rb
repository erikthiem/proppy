Rails.application.routes.draw do


  get '/games/select' => 'games#select'
  post '/games/create_nba' => 'games#create_nba'
  resources :games


  devise_for :creators
  resources :welcome
  resources :submissions



  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
