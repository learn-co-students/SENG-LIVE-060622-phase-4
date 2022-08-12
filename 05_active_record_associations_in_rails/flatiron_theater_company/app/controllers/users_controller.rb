class UsersController < ApplicationController

  def show 

    # I want to also include my users tickets, and those tickets productions
    user = User.find(params[:id])
    render json: user, status: :ok
  end
end
