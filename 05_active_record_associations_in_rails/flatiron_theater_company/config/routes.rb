Rails.application.routes.draw do
 
  resources :tickets
  resources :cast_members
  resources :users
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  # Custome Route 
 
  

end
