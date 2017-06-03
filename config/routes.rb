Rails.application.routes.draw do


  get '/games/select' => 'games#select'
  resources :games


  devise_for :creators
  resources :welcome



  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
