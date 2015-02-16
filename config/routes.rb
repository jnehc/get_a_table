Rails.application.routes.draw do
root 'restaurants#index'
resources :users, only: [:new, :create]
resources :restaurants do
	resources :reservations
end
resources :sessions


  


end

 

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  