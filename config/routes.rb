Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :invites
  resources :conversations
  resources :conversations do 
    resources :messages
  end
  
  
  get 'home/index'

  resources :categories
  devise_for :businesses
  devise_for :users, controllers: {registrations: "registrations"}
  resources :businesses do
    resources :events
  end

  resources :users do
    resource :profile
    resources :invites
    member do
      post :follow
      delete :unfollow
      get :following
      get :followers
    end
  end

  resources :events do 
    resources :comments
    resources :invites
    collection do
      get :search
    end
  end
  resources :comments


  resources :places


  root "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
