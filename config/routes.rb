Rails.application.routes.draw do
#root :to => 'restaurants#index';
root 'restaurants#index'

resources :sessions, only: [:new, :create, :destroy]

resources :reservations, only: [:new, :create]

resources :users, only: [:new, :create]
  
resources :restaurants


end

 

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  