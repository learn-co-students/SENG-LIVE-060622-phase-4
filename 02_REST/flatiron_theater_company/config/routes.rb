Rails.application.routes.draw do

# get '/productions', to:'productions#index'
# get '/productions/:id', to:'productions#show'
# post '/productions', to: 'productions#create'

# this going to follow ONLY REST pattern
# limit our routes using only, except
resources :productions, only: [:index, :show, :create, :update, :destroy]






end
