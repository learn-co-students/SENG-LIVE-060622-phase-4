class ProductionsController < ApplicationController


  # I want to create an endpoint that sends a response of all production records as JSON with a status of 200


  # conventional pattern called REST: index, show, update, create, destroy 

  # index action: responsible for returning all records of that resource
  # return a status of 200
  def index 
    productions = Production.all
    render json: productions, status: :ok
  end
end
