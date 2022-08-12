class TicketsController < ApplicationController

  def show
    ticket = Ticket.find(params[:id])
    render json: ticket, status: :ok
end 
end
