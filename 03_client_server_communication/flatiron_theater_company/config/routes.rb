Rails.application.routes.draw do
  resources :productions, only: [:index, :show, :create, :update, :destroy]
end
