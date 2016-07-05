Rails.application.routes.draw do
  
  get 'home/index'

  resources :categories
  devise_for :businesses
  devise_for :users
  resources :businesses do
    resources :events
  end
  resources :users
  resources :events do 
    collection do
      get :search
    end
  end
  resources :places

  root "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
