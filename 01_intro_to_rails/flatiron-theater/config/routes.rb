Rails.application.routes.draw do



  # HTTP verb '/path', to: "controller#action"

  # get, post, patch, delete 

# custom route
  get '/welcome', to: "application#welcome"

  # following REST pattern
  get '/productions', to: "productions#index" 
end
