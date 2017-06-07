Rails.application.routes.draw do


  get '/games/select' => 'games#select'

  resources :games do
    get :play, on: :member
    get :live, on: :member
    post :lock, on: :member
    patch :update_correct_answers, on: :member
  end


  devise_for :creators
  resources :welcome
  resources :submissions



  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
