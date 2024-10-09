Rails.application.routes.draw do
  get "pages/index"
 
  resources :bookings
  resources :recommendations, only: [:create]
  resources :itineraries
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


  # Defines the root path route ("/")
   root "pages#index"
end
