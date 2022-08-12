class CastMembersController < ApplicationController

  def show 
    cast_member = CastMember.find(params[:id])
    render json: cast_member
  end
end
