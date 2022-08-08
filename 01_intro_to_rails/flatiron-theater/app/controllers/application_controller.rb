class ApplicationController < ActionController::API


  # actions
  def welcome 
    render json: "hello world" #return some json similar to: to_json
  end
end
